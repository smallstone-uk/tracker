<cfoutput>
    <div class="navbar navbar-default">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#getUrl()#">Time Tracker</a>
            </div>

            <div class="navbar-collapse collapse navbar-responsive-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="##" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            Projects
                            <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu project-list">
                            <cfset includeView('project.nav-list')>
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="javascript:void(0)" data-toggle="modal" data-target="##create-project-modal">New Project</a></li>
                    <li><a href="#getUrl('/logout')#">Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</cfoutput>
