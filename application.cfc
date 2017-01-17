component extends = "App.Framework.App"
{
    this.name = "TimeTracker";
    this.sessionManagement = true;
    this.applicationTimeout = createTimeSpan(2,0,0,0);
    this.sessionTimeout = createTimeSpan(0,0,30,0);

    public boolean function onApplicationStart()
    {
        application.mvc = {
            'datasource' = 'tracker',
            'migrationDatasource' = 'tracker',
            'migrationTableName' = 'migrations',
            'dataDirectory' = getCurrentPath('..\data\'),
            'baseDirectory' = getCurrentPath()
        };

        return true;
    }
}
