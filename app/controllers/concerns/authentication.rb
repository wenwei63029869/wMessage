# module Authentication
#   extend ActiveSupport::Concern

#   included do
#     before_action :ensure_authenticated_user
#   end

#   private
#     def ensure_authenticated_user
#       put 'authenticate'
#       authenticate_user(current_user.id) || redirect_to(root)
#     end

#     def authenticate_user(user_id)
#       if authenticated_user = User.find_by(id: user_id)
#         cookies.signed[:user_id] ||= user_id
#         authenticated_user
#       end
#     end

#     def unauthenticate_user
#       ActionCable.server.disconnect(current_user: @current_user)
#       @current_user = nil
#       cookies.delete(:user_id)
#     end
# end