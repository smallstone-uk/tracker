<cfoutput>
    <div class="modal show">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Register</h4>
                </div>

                <form method="post" action="#getUrl('/register')#">
                    <div class="modal-body">
                        <div class="form-group label-floating">
                            <label class="control-label" for="username">Username</label>
                            <input type="text" class="form-control" id="username" name="username">
                        </div>

                        <div class="form-group label-floating">
                            <label class="control-label" for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password">
                        </div>
                    </div>

                    <div class="modal-footer modal-even">
                        <a href="#getUrl('/login')#" class="pull-left">Use existing account</a>

                        <input type="submit" class="btn btn-primary btn-raised pull-right" value="Register">
                    </div>
                </form>
            </div>
        </div>
    </div>
</cfoutput>
