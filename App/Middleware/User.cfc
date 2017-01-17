component
{
    public any function init()
    {
        return !auth().guest();
    }
}
