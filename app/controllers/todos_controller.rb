class TodosController < ApplicationController
  def show
    @tasks = Task.all
  end

  def create
    @test = "test"
  end

  def destroy
    @test = "test"
  end
end
