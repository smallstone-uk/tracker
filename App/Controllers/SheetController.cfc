component extends = "App.Framework.Controller"
{
    public any function invoice(any args)
    {
        return view('invoices.index', {
            'sheet' = new App.Sheet(val(args.id)),
            'hideEmployee' = structFindDefault(args, 'hideEmployee', false)
        });
    }
}
