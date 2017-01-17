component
{
    public any function init()
    {
        route().middleware('user')
            .get('/project/{id}', 'ProjectController@index')
            .get('/logout', 'AuthController@logout');

        route()
            .get('/', 'CommonController@index')
            .get('/login', 'AuthController@index')
            .post('/login', 'AuthController@login')
            .get('/register', 'AuthController@signup')
            .post('/register', 'AuthController@register');
    }
}
