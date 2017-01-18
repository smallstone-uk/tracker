component extends = "App.Framework.AuthController"
{
    /**
     * Shows the login form.
     *
     * @return any
     */
    public any function index()
    {
        return view('layouts.index|user.login', {
            'title' = 'Login',
            'nav' = false
        });
    }

    /**
     * Shows the register form.
     *
     * @return any
     */
    public any function signup()
    {
        return view('layouts.index|user.register', {
            'title' = 'Register',
            'nav' = false
        });
    }

    /**
     * Verifies the given form credentials and logs in the user.
     *
     * @return any
     */
    public any function login()
    {
        var user = new App.User().where('username', form.username).take(1).get();

        if (!structIsEmpty(user)) {
            // User exists
            if (user.verify('password', form.password)) {
                // Password correct
                auth().login(user, structKeyExists(form, 'remember_me'));
                redirect().to('/');
            } else {
                // Password incorrect
                redirect().to('/');
            }
        } else {
            // User doesn't exist
            redirect().to('/');
        }
    }

    /**
     * Unauthenticates the user and redirects to homepage.
     *
     * @return any
     */
    public any function logout()
    {
        auth().logout();
        redirect().to('/login');
    }

    /**
     * Registers the new user.
     *
     * @return any
     */
    public any function register()
    {
        try {
            new App.User().save(form);
            redirect().to('/login');
        } catch (any error) {
            redirect().to('/register');
        }
    }

    /**
     * Returns the model to use when authenticating users.
     * Model must have a 'remember_token' ID field.
     *
     * @return any
     */
    public any function model()
    {
        return new App.User();
    }
}
