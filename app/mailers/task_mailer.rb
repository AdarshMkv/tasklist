class TaskMailer < ApplicationMailer
    
    def send_assigned_task(user,task)
        @user=user
        @task=task
        mail(to: @user.email,subject:"Assigned Task")
    end

    def update_assigned_task(user,task)
        @user=user
        @task=task
        mail(to: @user.email,subject:"Task Update")
    end
end
