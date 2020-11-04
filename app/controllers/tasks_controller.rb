class TasksController < ApplicationController
    before_action :set_list
    before_action :set_task, except: [:create]

    def create
      @task = @list.tasks.create(task_params)
      redirect_to @list
    end

    def destroy
        @task = @list.tasks.find(params[:id])
        if @task.destroy
            flash[:success] = "Task was created."
        else
            flash[:error] = "Task couldn't be deleted."
        end
        redirect_to @list
    end

    def complete
      @task.update_attribute(:done, Time.now)
      redirect_to @list, notice: "Task Completed"
    end

    private

    def set_list
        @list = List.find(params[:list_id])
    end
    
    def set_task
        @task = @list.tasks.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:task)
    end
end
