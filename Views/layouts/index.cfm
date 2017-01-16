<cfscript>
    // user = new App.User(1);
    // auth().login(user);
    writeDump(session);
    writeDump(auth().guest());
</cfscript>

<cfoutput>
    <!DOCTYPE html>
    <html>
        <head>
            <title>#title#</title>
            <cfset includeView('layouts.resources')>
        </head>

        <body>
            <script>
                $(document).ready(function(e) {
                    $.material.init();
                });
            </script>

            <cfset includeView('layouts.nav')>
            <cfset includeView('modals.create-project')>
            
            <div class="container">
                #includeContent()#
            </div>
        </body>
    </html>
</cfoutput>
