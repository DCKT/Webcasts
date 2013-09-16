class RegistrationsController < Devise::RegistrationsController
	
	def sign_in_params
		params.require(:user).permit(:email, :password, :remember_me)
	end
	def sign_up_params
		params.require(:user).permit(:email, :nom, :prenom, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:email, :nom, :prenom, :password, :password_confirmation, :current_password)
	end

	private :sign_up_params
	private :account_update_params
	private :sign_in_params

end
