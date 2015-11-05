class AccountsController < ApplicationController
	skip_before_filter :authenticate_user, only:[ :new, :create ]
	def new
		@user = User.new
		@email = @user.emails.build
	end 

	def create
	end 

	def update
		if current_user.update_attributes(params[:user])
			flash[:notice] = t("flash.accounts.update.notice")
			redirect_to :account 
		else
			render :show
		end 
	end 

end
