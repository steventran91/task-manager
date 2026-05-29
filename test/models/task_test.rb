require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "valid task saves successfully" do
    task = Task.new(title: "Make coffee", status: "pending")
    assert task.valid?
  end

  test "invalid task without title" do
    task = Task.new(status: "pending")
    assert_not task.valid?
  end

  test "invalid task without status" do
    task = Task.new(title: "Buy groceries")
    assert_not task.valid? 
  end

  test "invalid task with invalid status" do
    task = Task.new(title: "Do laundry", status: "tomorrow")
    assert_not task.valid?
  end
end
