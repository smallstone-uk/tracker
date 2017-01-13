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

        // Load the config into application
        var config = (fileExists(getBaseDir('app.json'))) ? deserializeJSON(fileRead(getBaseDir('app.json'))) : {};
        for (key in config) { application[key] = config[key]; }

        return true;
    }

    public void function onRequestStart()
    {
        if (structKeyExists(url, 'restart')) {
            onApplicationStart();
            writeDumpToFile(application);
        }
    }

    public any function onSessionStart()
    {
        session.started = now();
        session.user = {};
    }

    public any function onRequest(required string thePage)
    {
        include thePage;
    }
}
