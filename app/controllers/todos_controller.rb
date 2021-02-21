class TodosController < ApplicationController
  #Get /todos
  def index
    @todos = Todos.all
    render json: @todos
  end
end
