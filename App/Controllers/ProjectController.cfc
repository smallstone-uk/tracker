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
    public any function index(struct params = {})
    {
        var project = new App.Project(params.id);

        return view('layouts.index|project.index', {
            'title' = project.name,
            'project' = project,
            'hideControls' = false,
            'linkTitle' = false
        });
    }

    /**
     * Shows the sheet list partial view for the given project.
     *
     * @return any
     */
    public any function sheetList(struct params)
    {
        var project = new App.Project(params.id);
        
        return view('sheets.list', {
            'project' = project,
            'sheets' = project.sheets(),
            'hideControls' = false
        });
    }
}
