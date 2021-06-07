# coding: utf-8
module CurrentUserHelper
  include JsonWebTokenHelper

  #客户端发来的jwt
  def request_jwt
    request.headers["Token"]
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user = User.find_by :id => request_jwt_user_id
    if @current_user
      @current_user
    else
      raise TokenExpireError, 'Token 无对应员工'
    end
  end


  alias_method :current_user_id, :request_jwt_user_id
end
