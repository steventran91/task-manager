class TasksController < ApplicationController
    def index
        tasks = Task.all 
        render json: tasks 
    end 

    def create 
        task = Task.new(task_params)
        if task.save
            render json: task, status: :created
        else
            render json: task.errors, status: :unprocessable_entity
        end 
    end

    def show
        task = Task.find(params[:id])
        render json: task 
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Task not found'}, status: :not_found
    end

    def update
        current_task = Task.find(params[:id])
        if current_task.update(task_params)
            render json: current_task, status: :ok
        else
            render json: current_task.errors, status: :unprocessable_entity
        end
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Task not found'}, status: :not_found
    end 

    def destroy
        task = Task.find(params[:id])
        task.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {error: 'Task not found'}, status: :not_found
    end

    private 
    def task_params
        params.require(:task).permit(:title, :description, :status, :due_date)
    end
end