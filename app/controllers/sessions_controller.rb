class SessionsController < Devise::SessionsController

  private

  def respond_with(resource, _opts = {})
  	debugger
    render :json => resource
  end

  def respond_to_on_destroy
  	debugger
    head :no_content
  end

end