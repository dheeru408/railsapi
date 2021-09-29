module AuthenticationHelper

  def authenticate_user user
    debugger
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.headers.merge! user.create_new_auth_token
    sign_in user
  end
end