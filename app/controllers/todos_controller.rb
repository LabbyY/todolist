class TodosController < ApplicationController

#GET /todos
  def index
      def new
      end


  def todo_params
    todo_params = params[:todo]
    todo_params ? todo_params.permit(:content, :comment, :is_finished) : {}
  end
end
