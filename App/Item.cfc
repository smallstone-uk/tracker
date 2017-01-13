component extends = "Framework.Model"
{
    variables.table = "items";
    variables.model = "Item";

    /**
     * Gets the duration in hours.
     *
     * @return any
     */
    public numeric function durationInHours()
    {
        return decimalFormat(this.duration / 60);
    }

    /**
     * Gets the item's header model.
     *
     * @return any
     */
    public any function getHeader()
    {
        return this.belongsToOne('Header', 'header');
    }
}
