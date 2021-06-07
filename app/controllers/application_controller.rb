class ApplicationController < ActionController::Base
  include JsonResponseHelper
  include CurrentUserHelper

  before_action :current_user

  rescue_from LogicError, with: :logic_error_handler
  rescue_from TokenExpireError, with: :token_expire_error_handler

  private
  def logic_error_handler(error)
    response_json JSON.parse(error.message), error: true
  end

  def token_expire_error_handler(error)
    response_json 'token_expire', error: 403
  end


end
