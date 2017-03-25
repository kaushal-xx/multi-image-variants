class UserMailer < ApplicationMailer
	default from: 'starappstechnology@gmail.com'

   def install_app(to_email, params)
   	  @params = params
      mail(to: to_email, subject: "Welcome email")
   end

   def uninstall_app(to_email, params)
   	  @params = params
	  mail(to: to_email, subject: "Uninstall App")
   end
end
