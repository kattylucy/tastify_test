class TasksController < ApplicationController
    before_action :set_task, only: [:update, :show]

    def new
        @task = Task.new
    end

    def index
    end

    def create
       @task = Task.new(permitted_params)
       @task.user_id = current_user.id

       if @task.save
        flash[:notice] = 'Task created'
       else
        flash[:notice] = 'Error while creating task'
       end
    end

    def update
        if @task.update(permitted_params)
            redirect_to root_path, notice: 'Task was successfully updated.'
        end
    end

    def show
        render 'index'
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def permitted_params
        params.require(:task).permit(:title, :description, :due_date, :priority, :status)
    end

end
