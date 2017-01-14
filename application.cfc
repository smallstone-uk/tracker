component
{
    this.name = "TimeTracker";
    this.sessionManagement = true;
    this.applicationTimeout = createTimeSpan(2,0,0,0);
    this.sessionTimeout = createTimeSpan(0,0,60,0);
    this.setClientCookies = true;

    // Boot Framework
    new App.Framework.Application.Boot();

    public boolean function onApplicationStart()
    {
        application.mvc = {
            'datasource' = 'tracker',
            'migrationDatasource' = 'tracker',
            'dataDirectory' = (getDirectoryFromPath(getCurrentTemplatePath()) & "..\data\"),
            'baseDirectory' = getDirectoryFromPath(getCurrentTemplatePath()),
            'migrationTableName' = 'migrations'
        };

        return true;
    }

    public void function onRequestStart()
    {
        if (structKeyExists(url, 'restart')) {
            onApplicationStart();
        }

        new web();
    }

    public any function onRequest(required string thePage)
    {
        route().handle(thePage);
    }
}
