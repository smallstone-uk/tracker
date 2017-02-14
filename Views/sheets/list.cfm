<cfoutput>
    <cfloop array="#sheets#" index="s">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" title="#s.created_at#">#s.title# &mdash; #humanTimeDiff(s.created_at)#</h3>
            </div>

            <cfif NOT hideControls>
                <div class="panel-body">
                    <button type="button" class="btn btn-raised btn-danger btn-icon pull-right ctrl-delete-header ml-3" data-id="#s.id#">
                        <i class="material-icons">delete</i>
                    </button>

                    <button type="button" class="btn btn-raised btn-primary pull-right ml-3" data-toggle="modal" data-target="##create-item-modal" data-id="#s.id#">Add</button>

                    <button type="button" class="btn pull-right ml-3 ctrl-invoice" data-id="#s.id#">
                        <i class="material-icons">file_download</i>
                        Employee Invoice
                    </button>

                    <button type="button" class="btn pull-right ctrl-invoice" data-hideemployee="true" data-id="#s.id#">
                        <i class="material-icons">file_download</i>
                        Client Invoice
                    </button>
                </div>
            </cfif>

            <table class="table table-bordered">
                <cfset totalHours = 0>

                <cfloop array="#s.items()#" index="i">
                    <cfset totalHours += i.durationInHours()>

                    <tr>
                        <td>
                            <p style="margin: 0;width: 90%;float: left;word-break: break-word;">#i.comment#</p>
                            <cfif NOT hideControls>
                                <button type="button" style="width: 10%;" class="btn btn-sm btn-danger pull-right ctrl-delete-item" data-id="#i.id#">Delete</button>
                            </cfif>
                        </td>

                        <td width="150" align="right">#i.durationInHours()# hours &times; &pound;#s.employeeRate#</td>
                        <td width="150" align="right">&pound;#decimalFormat(i.durationInHours() * s.employeeRate)#</td>
                    </tr>
                </cfloop>

                <tr>
                    <td style="font-weight: bold" align="right" width="150" colspan="2">#totalHours# hours &times; &pound;#s.employeeRate#</td>
                    <td style="font-weight: bold" align="right" width="150">&pound;#decimalFormat(s.employeeTotal())#</td>
                </tr>
            </table>
        </div>
    </cfloop>
</cfoutput>
