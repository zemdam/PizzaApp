class ApplicationController < ActionController::Base
     helper_method :sort_direction
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

     def sort_column(table)
          table.include?(params[:sort]) ? params[:sort] : "id"
     end
 
     def sort_direction
          %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
     end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :password)}
         end
end
