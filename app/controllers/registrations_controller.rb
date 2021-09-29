class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
  	debugger
    if resource.save
			sign_up(resource_name, resource)
			render :json => resource
		else
			render :json => {message: "fail", status: 400}
		end	
  end
end