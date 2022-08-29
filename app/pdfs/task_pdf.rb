class TaskPdf < Prawn::Document
    def initialize(tasks)
        super()
        @tasks = Task.all
        task_id
    end
    def task_id
        table task_id_all
    end
    def task_id_all
        [["ID","Task Name","Due Date","Status"]] +
        @tasks.map do |task|
            arr1 = task.status ? "Completed" : "Pending"
            [task.id,task.taskname,task.duedate,arr1]
        end
    end
end