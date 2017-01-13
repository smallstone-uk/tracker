<cfoutput>
    <cfloop array="#headers#" index="h">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title" title="#h.created_at#">#h.title# &mdash; #humanTimeDiff(h.created_at)#</h3>
            </div>

            <div class="panel-body">
                <button type="button" class="btn btn-raised btn-danger pull-right ctrl-delete-header ml-3" data-id="#h.id#">Delete</button>
                <button type="button" class="btn btn-raised btn-primary pull-right ml-3" data-toggle="modal" data-target="##create-item-modal" data-id="#h.id#">Add</button>
                <button type="button" class="btn btn-raised pull-right ml-3 ctrl-invoice" data-id="#h.id#">Employee Invoice</button>
                <button type="button" class="btn btn-raised pull-right ctrl-invoice" data-hideemployee="true" data-id="#h.id#">Client Invoice</button>
            </div>

            <table class="table table-bordered">
                <cfloop array="#h.items()#" index="i">
                    <tr>
                        <td>
                            #i.comment#
                            <button type="button" class="btn btn-sm btn-danger pull-right ctrl-delete-item" data-id="#i.id#">Delete</button>
                        </td>

                        <td width="150" align="right">#i.durationInHours()# hours</td>
                        <td width="150" align="right">&pound;#decimalFormat(i.durationInHours() * h.employeeRate)#</td>
                    </tr>
                </cfloop>

                <tr>
                    <td style="font-weight: bold" align="right" width="150" colspan="3">&pound;#h.employeeTotal()#</td>
                </tr>
            </table>
        </div>
    </cfloop>
</cfoutput>
