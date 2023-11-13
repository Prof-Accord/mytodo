class UsersController < ApplicationController
  def index
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @todos = @user.todos.all
    @todos = Kaminari.paginate_array(@todos).page(params[:page])
  end
end
