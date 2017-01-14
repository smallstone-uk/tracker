<cfoutput>
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
    
    <h2 class="mb-3">
        #project.name#

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
    </h2>

    <div class="sheet-list">
        <cfset view('sheets.list', {
            'sheets' = project.sheets()
        })>
    </div>

    <cfset view('modals.create-item', {
        'project' = project
    })>

    <cfset view('modals.create-header', {
        'project' = project
    })>
</cfoutput>
