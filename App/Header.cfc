component extends = "Framework.Model"
{
    variables.table = "headers";
    variables.model = "Header";

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
     * Gets all items associated with this header.
     *
     * @return array
     */
    public array function items()
    {
        return this.hasMany('Item', 'id', 'header');
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
}
