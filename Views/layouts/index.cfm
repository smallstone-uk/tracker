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

            <cfif structFindDefault(variables, 'nav', true)>
                <cfset includeView('layouts.nav')>
            </cfif>

            <cfset includeView('modals.create-project')>

            <div class="container">
                #includeContent()#
            </div>
        </body>
    </html>
</cfoutput>
