class ApplicationController < ActionController::Base
  include ShopifyApp::LoginProtection
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def setup_session
  	if params[:shop].present?
	  	domain = params[:shop]
	    @shop = Shop.find_by_shopify_domain(domain)
	    @shop.set_store_session if @shop.present?
	end
  end
end
