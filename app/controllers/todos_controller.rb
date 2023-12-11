class TodosController < ApplicationController
  def show
    @tasks = Task.all
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      flash[:success] = "Todo created!"
      redirect_to root_url
    else
      render 'static_pages/home', status: :unprocessable_entity
    end
  end

  def destroy
    @test = "test"
  end

  private

  def todo_params
    params.require(:todo).permit(:content)
  end
end
