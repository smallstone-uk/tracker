component extends = "Framework.Model"
{
    variables.table = "projects";
    variables.model = "Project";

    public array function sheets()
    {
        return this.hasMany('Sheet', 'id', 'projectID', 'created_at', 'desc');
    }
}
