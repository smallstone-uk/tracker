<cfoutput>
    <cfloop array="#new App.Project().all()#" index="p">
        <li><a href="#getUrl('/project/#p.id#')#">#p.name#</a></li>
    </cfloop>
</cfoutput>
