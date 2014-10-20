ready = ->

renewGood = (good_count) ->
 $('#good-counter').text(good_count)
gon.watch('good', interval: 1000, renewGood)

renewWarnings = (warning_count) ->
 $('#warning-counter').text(warning_count)
gon.watch('warning', interval: 1000, renewWarnings)

renewAlerts = (alert_count) ->
 $('#alert-counter').text(alert_count)
gon.watch('alert', interval: 1000, renewAlerts)

$(document).ready(ready)
$(document).on('page:load', ready)