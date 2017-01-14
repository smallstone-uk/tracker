component extends = "App.Framework.Controller"
{
    public any function index()
    {
        return view('layouts.index|home.index', {
            'title' = 'Time Tracker'
        });
    }
}
