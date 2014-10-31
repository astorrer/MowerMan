$.rails.allowAction = (link) ->
  return true unless link.attr('data-confirm')
  $.rails.showConfirmDialog(link) # look bellow for implementations
  false # always stops the action since code runs asynchronously

$.rails.confirmed = (link) ->
  link.removeAttr('data-confirm')
  link.trigger('click.rails')

$.rails.showConfirmDialog = (link) ->
  message = link.attr 'data-confirm'
  html = """
        <div class="modal" id="confirmationDialog">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">#{message}</h4>
              </div>
              <div class="modal-body">
                <p>Are really sure that you want to delete this?</p>
              </div>
              <div class="modal-footer">
                <a data-dismiss="modal" class="btn btn-default">CANCEL</a>
                <a data-dismiss="modal" class="btn btn-danger confirm">DELETE</a>
              </div>
            </div>
          </div>
        </div>
         """
  $(html).modal()
  $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)