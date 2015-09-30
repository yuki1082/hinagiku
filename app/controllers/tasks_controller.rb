class TasksController < ApplicationController
	before_filter :prepare, only: [:index, :done]

	def index
			@tasks = @tasks.undone.paginate(page: params[:page], per_page: 10)
	end 

	def show
		@task = current_user.find(params[:id])
	end 

	def new
		@task = Task.new
	end 

	def edit 
		@task = current_user.find(params[:id])
	end 

	def update
		@task = current_user.find(params[:id])
		if @task.update_attributes(params[:task])
			redirect_to @task
		else
			render :edit
		end 
	end 

	def create
		@task = Task.new(params[:task])
		@task.owner = current_user
		if @task.save
			redirect_to @task
		else
			render :new
		end 
	end 

	def destroy
		@task = current_user.tasks.find(params[:id])
		@task.destroy
		redirect_to :tasks #check later
	end 

	def finish
		@task = current_user.tasks.find(params[:id])
		@task.update_attribute(:done, true)
		redirect_to :back
	end 

	def done
		@tasks = @tasks.done.paginate(page: params[:page], per_page: 10)
		render :index
	end 

	def restart
		@task = current_user.find(params[:id])
		@task.update_attribute(:done, false)
		redirect_to :back
	end 

	def search
		@tasks = current_user.tasks.undone
		@tasks = @tasks.search(params[:q]) if params[:q].present?
		@tasks = @tasks.paginate(page: params[:page], per_page: 10)
		render :index
	end 

	private 

	def prepare
		if params[:category_id]
			@category = current_user.categories.find(params[:category_id])
			@tasks = @category.tasks
		else
			@tasks= current_user.tasks
		end 
	end 


end
