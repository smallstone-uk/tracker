<cftry>
    <cfset invoiceIndex = sheet.nextInvoiceNumber()>
    <cfset publishDir = getDataDir('/invoices/#sheet.id#', true)>
    <cfset publishPath = getDataDir('/invoices/#sheet.id#/#invoiceIndex#.pdf')>
    <cfset rate = (hideEmployee) ? sheet.clientRate : sheet.employeeRate>

    <cfoutput>
        <cfdocument 
            mimeType = "text/html"
            format = "PDF" 
            filename = "#publishPath#" 
            orientation = "portrait" 
            overwrite = "yes"> 
            
            <cfoutput>
                <cfset fontSize = "12px">

                <!DOCTYPE html>

                <html>
                    <head>
                        <meta charset="utf-8">
                        <title>Invoice #invoiceIndex#</title>
                    </head>

                    <body style="position:fixed;top:0;left:0;right:0;bottom:0;font-family:Arial;">
                        <cfdocumentsection>
                            <style type="text/css">
                                body {font-family: Tahoma;font-size:#fontSize# !important;}
                                table {border-collapse:collapse; border:none;font-size:#fontSize# !important; vertical-align:top;}
                                tr {vertical-align:top;}
                                td {padding:0;font-size:#fontSize# !important;color:##333; vertical-align:top;}
                                th {color:##333;padding:0; vertical-align:top;}
                            </style>

                            <table width="100%" border="0">
                                <tr>
                                    <td>Kingsley Computer Consultants Ltd</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>5 Fir Close</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>Goonhavern</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>Truro</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>Cornwall</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>TR4 9QN</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>United Kingdom</td>
                                    <td>&nbsp;</td>
                                </tr>

                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>
                                        <strong>DATE:</strong>
                                        #lsDateFormat(now(), "dd/mm/yyyy")#
                                    </td>

                                    <td align="right">
                                        <strong>REF:</strong>
                                        #invoiceIndex#
                                    </td>
                                </tr>
                            </table>

                            <table width="100%" border="0">
                                <tr>
                                    <td align="left">
                                        <strong>SHEET:</strong>
                                        #sheet.title#
                                    </td>

                                    <td align="right">
                                        <strong>
                                            <cfif hideEmployee>
                                                CLIENT RATE:
                                            <cfelse>
                                                EMPLOYEE RATE:
                                            </cfif>
                                        </strong>
                                        &pound;#decimalFormat(rate)#
                                    </td>
                                </tr>
                            </table>

                            <table width="100%" border="0" style="float:left;width:100%;margin-top:20px;">
                                <thead>
                                    <tr>
                                        <th align="left" colspan="3">DESCRIPTION</th>
                                        <th align="right" width="100">HOURS</th>
                                        <th align="right" width="100">TOTAL</th>
                                    </tr>
                                    <tr><td>&nbsp;</td></tr>
                                </thead>

                                <tbody>
                                    <cfloop array="#sheet.items()#" index="item">
                                        <tr>
                                            <td colspan="3">#item.comment#</td>
                                            <td align="right">#item.durationInHours()#</td>
                                            <td align="right">&pound;#decimalFormat(item.durationInHours() * rate)#</td>
                                        </tr>
                                    </cfloop>

                                    <tr><td>&nbsp;</td></tr>

                                    <tr>
                                        <td colspan="3">
                                            <strong>
                                                <cfif hideEmployee>
                                                    CLIENT TOTAL
                                                <cfelse>
                                                    EMPLOYEE TOTAL
                                                </cfif>
                                            </strong>
                                        </td>

                                        <td></td>

                                        <td align="right">
                                            <strong>
                                                <cfif hideEmployee>
                                                    &pound;#decimalFormat(sheet.clientTotal())#
                                                <cfelse>
                                                    &pound;#decimalFormat(sheet.employeeTotal())#
                                                </cfif>
                                            </strong>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </cfdocumentsection>
                    </body>
                </html>
            </cfoutput>
        </cfdocument>

        #getUrl('/data/invoices/#sheet.id#/#invoiceIndex#.pdf')#
    </cfoutput>

    <cfcatch type="any">
        <cfset writeDumpToFile(cfcatch)>
    </cfcatch>
</cftry>
