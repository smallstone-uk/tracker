component extends = "App.Framework.Controller"
{
    public any function invoice(any params)
    {
        return view('invoices.index', {
            'sheet' = new App.Sheet(val(params.id)),
            'hideEmployee' = structFindDefault(params, 'hideEmployee', false)
        });
    }
}
