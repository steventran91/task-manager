require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
    test "get all tasks" do
        get "/tasks"
        assert_response :success
    end

    test "create task successfully" do 
        post "/tasks",
        params: {task: {title: "buy milk", status: "pending"}},
        as: :json
        assert_response :created
    end 

    test "return error with invalid data" do 
        post "/tasks",
        params: {task: {status: "pending"}},
        as: :json
        assert_response :unprocessable_entity
    end

    test "get task by id" do 
        task = Task.create(title: "buy milk", status: "pending")
        get "/tasks/#{task.id}"
        assert_response :success
    end

    test "update a task" do 
        task = Task.create(title: "buy milk", status: "pending")
        patch "/tasks/#{task.id}",
        params: {task: {status: "completed"}},
        as: :json
        assert_response :success
    end 

    test "delete a task" do 
        task = Task.create(title: "buy milk", status: "completed")
        delete "/tasks/#{task.id}"
        assert_response :no_content
    end
end