class Api::V1::LikesController < Api::BaseController
	respond_to :json

  def create
  	if params[:type] == "post" #(we compare post from type and type vaule will get from postman )
      likeable_obj = Post.find(params[:id])
    else
    	likeable_obj = Comment.find(params[:id])
    end
    likeable_obj.likes.create(user_id: current_user.id)
    render :json => {:status => "success"}
  end

  def post_likes
  	post = Post.find(params[:post_id])
  	likes = post.likes
  	emails = []
  	likes.each do |like|
  	  emails << like.user.email
  	end
    render :json => {:users => emails }
  end	

  def comment_likes
  	comment = Comment.find(params[:id])
  	comment.likes
  end

end