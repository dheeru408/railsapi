class Api::V1::UsersController < Api::BaseController
	respond_to :json

	# def index
	# 	binding.pry
	# 	respond_with User.all
	# end

	def show
		render :json => current_user
	end	

	# def create
	# 	render :json => User.create(user_params)
	# end	

	def update
		if current_user.update(user_params)
			render :json => current_user
		else
			render :json => {"error"=> "402"}
		end
	end

	private
	 def user_params
	 	params.require(:user).permit(:email,:password)
	 end	

		
end
