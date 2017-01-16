component
{
    public any function init()
    {
        route().middleware('user')
            .get('/settings', 'user.settings');

        route()
            .get('/', 'CommonController@index')
            .get('/project/{id}', 'ProjectController@index')
            .get('/user', 'user.index');
    }
}
