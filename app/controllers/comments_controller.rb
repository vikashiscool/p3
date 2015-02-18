class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@favorite = Favorite.find(params[:favorite_id])
		@comment = @favorite.comments.create(comment_params)

		if @comment.save 
			flash[:success] = "Comment saved."
			redirect_to favorite_path(@favorite) 
		end
	end

	def edit
		render 'edit'
	end

	def update		
		authorize @comment
		if @comment.update(comment_params)
			redirect_to @comment
		else
			render :edit
		end
	end

	def destroy
		@favorite = Favorite.find(params[:favorite_id])
    @comment = @favorite.comments.find(params[:id])
    @comment.destroy
    redirect_to @favorite
  end

    private

    def comment_params
   	 params.require(:comment).permit(:body) 
		end

  end