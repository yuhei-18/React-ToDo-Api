class TodosController < ApplicationController
  before_action :set_todo, only: %i[show destroy update]

  # Get /todos
  def index
    todos = Todo.all.order(:id)
    render json: todos
  end

  # Get /todos/:id
  def show
    render json: @todo
  end

  # POST /todos
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo
    else
      render json: todo.errors
    end
  end

  # PATCH /todos/:id
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors
    end
  end

  # DELETE /todos/:id
  def destroy
    if @todo.destroy
      render json: @todo
    else
      render json: @todo.errors
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.permit(:title, :content, :is_done, :priority, :due_date)
  end
end
