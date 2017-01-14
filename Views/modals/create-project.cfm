<cfoutput>
    <cfset fields = [
        ['Name', 'name'],
        ['Company', 'company'],
        ['Address Line 1', 'address1'],
        ['Address Line 2', 'address2'],
        ['City', 'city'],
        ['County', 'county'],
        ['Postcode', 'postcode'],
        ['Country', 'country']
    ]>

    <script>
        $(document).ready(function(e) {
            new Model('Project').bindCreate('.create-project-form', 'submit', function(p) {
                $('##create-project-modal').modal('hide');
                $('.project-list').routeContent('ProjectController', 'navList');
                window.location = getUrl('project/' + p.id);
            });
        });
    </script>

    <div class="modal fade" id="create-project-modal" tabindex="-1" role="dialog" aria-labelledby="create-project-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>

                    <h4 class="modal-title">Create Project</h4>
                </div>

                <div class="modal-body">
                    <form class="form create-project-form" method="post">
                        <cfloop array="#fields#" index="f">
                            <div class="form-group label-floating">
                                <label class="control-label" for="focusedInput#f[2]#">#f[1]#</label>
                                <input class="form-control" id="focusedInput#f[2]#" type="text" name="#f[2]#">
                            </div>
                        </cfloop>
                    </form>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="$('.create-project-form').submit()">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
