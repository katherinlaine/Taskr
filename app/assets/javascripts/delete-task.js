$(function () {
  var deleteTask = function(){

    task = $(this).parent();

    var promisory = $.ajax({
      type:"DELETE",
      url: $(this).attr("action")
    });

    promisory.done(removeTaskFromList);

    return false;
  };

  var removeTaskFromList = function() {
    task.fadeOut();
  };
  $("#task-list").on("submit", ".delete-task", deleteTask);
});
