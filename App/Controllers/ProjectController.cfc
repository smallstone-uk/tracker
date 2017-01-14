component extends = "App.Framework.Controller"
{
    public any function navList()
    {
        return view('project.nav-list');
    }

    /**
     * Shows the index page for the given project.
     *
     * @return any
     */
    public any function index(struct args = {})
    {
        var project = new App.Project(args.id);

        return view('layouts.index|project.index', {
            'title' = project.name,
            'project' = project
        });
    }

    /**
     * Shows the sheet list partial view for the given project.
     *
     * @return any
     */
    public any function sheetList(struct args)
    {
        var project = new App.Project(args.id);
        
        return view('sheets.list', {
            'project' = project,
            'sheets' = project.sheets()
        });
    }
}
