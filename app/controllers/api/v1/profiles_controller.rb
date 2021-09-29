class Api::V1::ProfilesController < Api::BaseController

	skip_before_action :verify_authenticity_token

	respond_to :json

	def index
		respond_with Profile.all
	end

	def show
		respond_with Profile.find(params[:id])
	end	

	def create
		render :json => User.find(params[:profile][:user_id]).build.profile(profile_params)
	end

	def update
		binding.pry
		render :json => Profile.find(params[:id]).update(profile_params)
	end	
	
	private

	def profile_params
	params.require(:profile).permit(:name,:number,:address)
	end	
end

