class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  	render :new
  end

  def create
  	@user = User.create(user_params)
  	redirect_to user_path(@user.id)
  end

  def edit
  end


end
