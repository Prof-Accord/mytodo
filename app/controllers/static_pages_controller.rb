class StaticPagesController < ApplicationController
  def home
    @todo = current_user.todos.build if user_signed_in?
  end

  def about
  end

  def help
  end
end
