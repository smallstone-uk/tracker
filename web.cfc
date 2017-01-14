component
{
    public any function init()
    {
        // Homepage
        route().get('/', 'CommonController@index');

        // Project page
        route().get('/project/{id}', 'ProjectController@index');
    }
}
