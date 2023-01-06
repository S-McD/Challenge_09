require "09_todo"

RSpec.describe Todo do
    it "initialises with a task" do
        todo = Todo.new("Buy milk")
        expect(todo).to eq todo
    end
    it "can return the task" do
        todo = Todo.new("Buy milk")
        expect(todo.task).to eq "Buy milk"
    end
    it "can mark a task as done" do
        todo = Todo.new("Buy milk")
        expect(todo.mark_done!).to eq true
    end
    it "checks if a task is done" do
        todo = Todo.new("Buy milk")
        todo_2 = Todo.new("Buy bread")
        todo.mark_done!
        expect(todo.done?).to eq true
        expect(todo_2.done?).to eq false
    end
end