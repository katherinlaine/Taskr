$(function() {
  var newTaskForm = $("#new_task");

  var createNewTask = function(){
    var formData = $(this).serialize();

    var taskRequest = $.ajax({
      url: "/tasks",
      type: "POST",
      data: formData,
    })

    taskRequest.done(addTaskToList);
    taskRequest.fail(addTaskError);
    return false;
  };

  var addTaskToList = function(taskHtml) {
    var taskList = $("#task-list");
    taskList.append(taskHtml);
    $("#errors").html("");
  }

  var addTaskError = function(response) {
    $("#errors").html(response.responseText);
  }

  newTaskForm.on("submit", createNewTask);
});
