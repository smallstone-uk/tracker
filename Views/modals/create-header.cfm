<cfoutput>
    <script>
        $(document).ready(function(e) {
            new Model('Sheet').bindCreate('.create-header-form', 'submit', function() {
                $('##create-header-modal').modal('hide');
                $('.sheet-list').routeContent('ProjectController', 'sheetList', {
                    id: #project.id#
                });
            });
        });
    </script>

    <div class="modal fade" id="create-header-modal" tabindex="-1" role="dialog" aria-labelledby="create-header-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>

                    <h4 class="modal-title">Create Sheet</h4>
                </div>

                <div class="modal-body">
                    <form class="form create-header-form" method="post">
                        <input type="hidden" name="projectID" value="#project.id#">
                        <input type="hidden" name="userID" value="#auth().user().id#">

                        <div class="form-group label-floating">
                            <label class="control-label" for="focusedInput1">Title</label>
                            <input class="form-control" id="focusedInput1" type="text" name="title">
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="focusedInput2">Employee Rate</label>
                            <div class="input-group">
                                <span class="input-group-addon">&pound;</span>
                                <input class="form-control" id="focusedInput2" type="text" name="employeeRate">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="focusedInput3">Client Rate</label>
                            <div class="input-group">
                                <span class="input-group-addon">&pound;</span>
                                <input class="form-control" id="focusedInput3" type="text" name="clientRate">
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="$('.create-header-form').submit()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
