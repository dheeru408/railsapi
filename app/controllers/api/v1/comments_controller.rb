class Api::V1::CommentsController < Api::BaseController

	respond_to :json

	def create
		binding.pry
		render :json => current_user.comments.create(comment_params)
	end	

	def show
		respond_with Comment.find(params[:id])
	end

	def index
		respond_with Comment.all
	end

	def update
		comment = Comment.find(params[:id])
		if comment.update(comment_params)
		   render :json => comment
		else
		   render :json => {:message => "not updated"}
		end      
	end	

	def destroy
		if Comment.find(params[:id]).destroy
    		render :json => {:deleted => "true"}
    	else
    		render :json => {:deleted => "false"}
    	
    	end  
	end	

	private

	def comment_params
		params.require(:comment).permit(:title,:body, :post_id)
	end	
end
