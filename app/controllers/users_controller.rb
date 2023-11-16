class UsersController < ApplicationController
  before_action :move_to_signed_in

  def index
    @users = User.all
    @users = Kaminari.paginate_array(@users).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @todos = @user.todos.all
    @todos = Kaminari.paginate_array(@todos).page(params[:page])
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      # サインインしていないユーザーはログインページが表示される
      redirect_to root_path
    end
  end
end
