class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  after_create :set_welcome
  
  def set_welcome
  	self.set_store_session
  	current_shop = ShopifyAPI::Shop.current.try(:attributes)
		UserMailer.install_app(current_shop[:email], current_shop).deliver_now rescue nil
  end

	def set_store_session
		sess = ShopifyAPI::Session.new(self.shopify_domain, self.shopify_token)
		ShopifyAPI::Base.activate_session(sess)
	end
end
