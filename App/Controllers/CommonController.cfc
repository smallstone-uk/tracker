component extends = "App.Framework.Controller"
{
    public any function index()
    {
        if (auth().guest()) {
            redirect().to('/login');
        } else {
            return view('layouts.index|home.index', {
                'title' = 'Time Tracker'
            });
        }
    }
}
