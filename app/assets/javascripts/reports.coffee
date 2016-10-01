# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  console.debug('ready.')
  $('#new_task_name').on('keyup', distributeTaskName)

# Copies user-entered task name to all occurrences
distributeTaskName = (event) ->
  taskName = event.target.value
  console.log 'change taskName', taskName
  $('input[name="task[name]"]').val(taskName)
