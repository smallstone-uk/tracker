<cfoutput>
    <cfif NOT hideControls>
        <script>
            $(document).ready(function(e) {
                new Model('Sheet').bindDelete('.ctrl-delete-header', 'click', function(el) {
                    $('.sheet-list').routeContent('ProjectController', 'sheetList', {
                        id: #project.id#
                    });
                });

                new Model('Item').bindDelete('.ctrl-delete-item', 'click', function(el) {
                    $('.sheet-list').routeContent('ProjectController', 'sheetList', {
                        id: #project.id#
                    });
                });

                new Model('Project').bindDelete('.btn-delproject', 'click', function() {
                    window.location = getUrl('/');
                });

                $(document).on("click", ".ctrl-invoice", function(event) {
                    var id = $(this).data('id');
                    var hideEmployee = $(this).data('hideemployee');

                    $.ajax({
                        type: 'POST',
                        url: '#route("SheetController", "invoice")#',
                        data: {
                            'id': id,
                            'hideEmployee': hideEmployee
                        },
                        success: function(data) {
                            window.open(data.trim(), "_blank");
                        }
                    });
                });
            });
        </script>
    </cfif>
    
    <h2 class="mb-3">
        <cfif linkTitle>
            <a href="#getUrl('/project/#project.id#')#">#project.name#</a>
        <cfelse>
            #project.name#
        </cfif>

        <cfif NOT hideControls>
            <button
                type="button"
                class="btn btn-raised btn-danger btn-delproject btn-icon pull-right ml-3"
                data-id="#project.id#"
            ><i class="material-icons">delete</i></button>

            <button
                type="button"
                class="btn btn-raised btn-primary pull-right"
                data-toggle="modal"
                data-target="##create-header-modal"
            >New Sheet</button>
        </cfif>
    </h2>

    <div class="sheet-list">
        <cfset view('sheets.list', {
            'sheets' = project.sheets(),
            'hideControls' = hideControls
        })>
    </div>

    <cfif NOT hideControls>
        <cfset view('modals.create-item', {
            'project' = project
        })>

        <cfset view('modals.create-header', {
            'project' = project
        })>
    </cfif>
</cfoutput>
