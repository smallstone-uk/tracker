<div class="modal fade" id="create-item-modal" tabindex="-1" role="dialog" aria-labelledby="create-item-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

                <h4 class="modal-title">Create Item</h4>
            </div>

            <div class="modal-body">
                <form class="form create-item-form" method="post">
                    <input type="hidden" name="header" value="">

                    <div class="form-group label-floating">
                        <label class="control-label" for="focusedInput1">Duration in minutes</label>
                        <input class="form-control" id="focusedInput1" type="text" name="duration">
                    </div>

                    <div class="form-group label-floating">
                        <label class="control-label" for="focusedInput2">Comment</label>
                        <textarea class="form-control" rows="3" id="focusedInput2" name="comment"></textarea>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="$('.create-item-form').submit()">Save changes</button>
            </div>
        </div>
    </div>
</div>
