class UsersController < ApplicationController

 #  def show
 #  	@user = User.find(params[:id])
	# end

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

  # def edit
  #   render 'edit'
  # end

  # def update    
  #   authorize @comment
  #   if @comment.update(comment_params)
  #     redirect_to @comment
  #   else
  #     render :edit
  #   end
  # end

private
  def user_params
    params.require(:user)
  end

end
