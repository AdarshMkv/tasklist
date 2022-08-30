$(document).ready(function() {
    $("#task_user_id").change(function (e){
        console.log("The assignee has been changed.");
        console.log($("#task_user_id").val());
        console.log($(this).serialize());
        e.preventDefault();
        $.ajax({
            type: 'POST',
            url: $('.edit_task').attr('action'),
            data: $('.edit_task').serialize(),
            dataType: 'JSON'
        }).done(function (data) {
            alert("Task assigned to user");
        }).fail(function (data) {
            alert(e);
        });
    });
  });