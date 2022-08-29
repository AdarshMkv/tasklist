class TaskPdf < Prawn::Document
    def initialize(tasks,users)
        super()
        @tasks = Task.all
        @users = User.all
        task_id
    end
    def task_id
        table task_id_all
    end
    def task_id_all
        [["ID","Task Name","Due Date","Status","Assigned To"]] +
        @tasks.map do |task|
            value={}
            User.all.each {|x| value[x.id] = x.first_name}
            arr1 = task.status ? "Completed" : "Pending"
            [task.id,task.taskname,task.duedate,arr1,value[task.user_id]]
        end
    end
end