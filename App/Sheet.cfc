component extends = "Framework.Model"
{
    variables.table = "sheets";
    variables.model = "Sheet";

    /**
     * Called when a header is deleted.
     *
     * @return any
     */
    public any function onDeleted()
    {
        if (directoryExists(getDataDir('/invoices/#this.id#'))) {
            directoryDelete(getDataDir('/invoices/#this.id#'), true);
        }
    }

    /**
     * Gets the next invoice number.
     *
     * @return any
     */
    public any function nextInvoiceNumber()
    {
        var n = this.invoiceNo + 1;
        this.invoiceNo += 1;
        this.save();
        return n;
    }

    /**
     * Gets all items associated with this header.
     *
     * @return array
     */
    public array function items()
    {
        return this.hasMany('Item', 'id', 'sheet');
    }

    /**
     * Gets the employee total.
     *
     * @return numeric
     */
    public numeric function employeeTotal()
    {
        var total = 0;

        for (item in this.items()) {
            total += item.durationInHours() * this.employeeRate;
        }

        return decimalFormat(total);
    }

    /**
     * Gets the client total.
     *
     * @return numeric
     */
    public numeric function clientTotal()
    {
        var total = 0;

        for (item in this.items()) {
            total += item.durationInHours() * this.clientRate;
        }

        return decimalFormat(total);
    }

    /**
     * Gets the project the sheet belongs to.
     *
     * @return any
     */
    public any function project()
    {
        return this.belongsToOne('Project', 'projectID');
    }
}
