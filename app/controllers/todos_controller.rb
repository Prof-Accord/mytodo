class TodosController < ApplicationController
  def show
    @tasks = Task.all
  end
end
