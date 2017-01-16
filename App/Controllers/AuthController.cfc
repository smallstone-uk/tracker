component extends = "App.Framework.AuthController"
{
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
