component extends = "App.Framework.Controller"
{
    public any function invoice()
    {
        return view('invoices.index', {
            'sheet' = new App.Sheet(val(form.id)),
            'hideEmployee' = structFindDefault(form, 'hideEmployee', false)
        });
    }
}
