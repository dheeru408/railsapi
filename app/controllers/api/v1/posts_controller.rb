class Api::V1::PostsController < Api::BaseController
	respond_to :json

	def index
		respond_with current_user.posts
	end

	def show
		respond_with Post.find(params[:id])
	end	
	
	def create
		render :json => current_user.posts.create(post_params)
	end

	def update
		post = Post.find(params[:id])
		if post.update(post_params)
		   render :json => post
		else
		   render :json => {:message => "post not updated"} 
		end  
	end	   

    def destroy
    	if Post.find(params[:id]).destroy
    		render :json => {:deleted => "true"}
    	else
    		render :json => {:deleted => "false"}
    	end    
    end	

	private

	def post_params
		params.require(:post).permit(:title,:body)
	end	
end
