class TasksController < ApplicationController
	def index
		@tasks = Task.undone
	end 

	def show
		@task = Task.find(params[:id])
	end 

	def new
		@task = Task.new
	end 

	def edit 
		@task = Task.find(params[:id])
	end 

	def update
		@task = Task.find(params[:id])
		@task.update_attributes(params[:task])
		redirect_to @task
	end 

	def create
		@task = Task.create(params[:task])
		redirect_to @task
	end 

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
		redirect_to :tasks
	end 

	def finish
		@task = Task.find(params[:id])
		@task.update_attribute(:done, true)
		redirect_to :back
	end 

	def done
		@tasks = Task.done
		render :index
	end 

	def restart
		@task = Task.find(params[:id])
		@task.update_attribute(:done, false)
		redirect_to :back
	end 

	def search
		@tasks = Task.undone
		@tasks = @tasks.search(params[:q]) if params[:q].present?
		render :index
	end 


end
