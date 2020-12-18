class ApplicationController < ActionController::Base
    include Pundit

    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:notice] = "Você não tem permissão para esta ação."
        redirect_to(request.referrer || root_path)
    end
end
