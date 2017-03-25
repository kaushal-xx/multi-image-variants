class CustomWebhooksController < ApplicationController
	#before_action :set_session
  include ShopifyApp::WebhookVerification

  def app_uninstall
    puts params.inspect
    # Shop.where(shopify_domain: params[:domain]).destroy_all
    UserMailer.uninstall_app(params[:email], params).deliver_now rescue nil
  end

end