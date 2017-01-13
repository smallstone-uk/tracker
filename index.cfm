<cfoutput>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Time Tracker</title>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
            <link rel="stylesheet" type="text/css" href="#getUrl('/Resources/css/bootstrap-material-design.min.css')#">
            <link rel="stylesheet" type="text/css" href="#getUrl('/Resources/css/ripples.min.css')#">
            <link rel="stylesheet" type="text/css" href="#getUrl('/Resources/css/tracker.css')#">
            <script src="#getUrl('/Resources/js/material.min.js')#"></script>
            <script src="#getUrl('/Resources/js/ripples.min.js')#"></script>
            <script src="#getUrl('/App/Framework/Client.js')#"></script>

            <script>
                $.material.init();

                $(document).ready(function(e) {
                    new Model('Header').bindDelete('.ctrl-delete-header', 'click', function(el) {
                        $('.header-list').routeContent('SheetController', 'showList');
                    });

                    new Model('Item').bindDelete('.ctrl-delete-item', 'click', function(el) {
                        $('.header-list').routeContent('SheetController', 'showList');
                    });

                    new Model('Item').bindCreate('.create-item-form', 'submit', function() {
                        $('##create-item-modal').modal('hide');
                        $('.header-list').routeContent('SheetController', 'showList');
                    });

                    new Model('Header').bindCreate('.create-header-form', 'submit', function() {
                        $('##create-header-modal').modal('hide');
                        $('.header-list').routeContent('SheetController', 'showList');
                    });

                    $('##create-item-modal').on('show.bs.modal', function(event) {
                        var button = $(event.relatedTarget);
                        $(this).find('input[name="header"]').val(button.data('id'));
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
        </head>

        <body>
            <cfset view('layouts.nav')>

            <div class="container header-list">
                <cfset view('sheets.list', {
                    'headers' = new App.Header().latest(100)
                })>
            </div>

            <cfset view('modals.create-item')>
            <cfset view('modals.create-header')>
        </body>
    </html>
</cfoutput>
