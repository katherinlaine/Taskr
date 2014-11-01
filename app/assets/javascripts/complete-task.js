$(function () {
  var completeTask = function(){

    var promisory = $.ajax({
      type:"POST",
      url: $(this).attr("action")
    });

    var task = $(this).parent();
    task.addClass("completed");

    return false;
  };

  $("#task-list").on("submit", ".complete-task", completeTask);
});
