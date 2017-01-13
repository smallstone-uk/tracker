component extends = "App.Framework.Controller"
{
    public any function showList()
    {
        return view('sheets.list', {
            'headers' = new App.Header().latest(100)
        });
    }

    public any function invoice(any args)
    {
        return view('invoices.index', {
            'header' = new App.Header(val(args.id)),
            'hideEmployee' = structFindDefault(args, 'hideEmployee', false)
        });
    }
}
