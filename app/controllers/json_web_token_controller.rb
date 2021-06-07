class JsonWebTokenController < ApplicationController
  user = User.auth(params[:identity], params[:password]) rescue raise_logic_error(101)
  render json: user.as_json(methods: token, except: 'password_digest')
end
