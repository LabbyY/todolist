class TodosController < ApplicationController

#GET /todos
  def index
    todo_all
    build_todo
  end

  def edit
  end

  def update
    build_todo
    respond_to do |format|
      if @todo.update(todo_attr_ordered)
        format.html {redirect_to todo_path, notice: "Updated successfully" }
      else
        format.html{ render :edit }
      end
    end
  end

  def create
    build_todo
    respond_to do |format|
      if @todo.save
        format.html {redirect _to todo_path, notice: "Created successfully"}
      else
        format.html{ render :index }
      end
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: "Deleted successfully"}
    end
  end


  private

  def todo_all
    @todos ||= Todo.ordered.all
  end

  def todo_attr_ordered
    todo_attr_ordered = params[:todo]
    todo_attr_ordered ? todo_attr_ordered.permit(:title, :remark, :is_finished) : {}
  end

  def build_todo
    @todo ||= Todo.ordered.new
    @todo.attributes = todo_attr_ordered
  end

end
