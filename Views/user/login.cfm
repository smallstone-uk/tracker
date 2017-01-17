<cfoutput>
    <div class="modal show">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Login</h4>
                </div>

                <form method="post" action="#getUrl('/login')#">
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

                    <div class="modal-footer">
                        <input type="submit" class="btn btn-primary btn-raised pull-right" value="Login">

                        <div class="togglebutton pull-right">
                            <label>
                                Remember me
                                <input type="checkbox" name="remember_me">
                            </label>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</cfoutput>
