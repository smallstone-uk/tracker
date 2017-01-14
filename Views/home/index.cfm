<cfoutput>
    <cfloop array="#new App.Project().latest(10)#" index="p">
        <cfset view('project.index', {
            'project' = p,
            'hideControls' = true,
            'linkTitle' = true
        })>
    </cfloop>
</cfoutput>
