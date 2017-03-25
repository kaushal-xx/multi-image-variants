class ScriptsController < ApplicationController

	def product_variants
		puts params.inspect
		@shop = Shop.find_by_shopify_domain(params[:shop])
	    respond_to do |format|
	      format.html { }
	      format.json { }
	      format.js {}
	    end
	end

	def update_script
		shop = Shop.find_by_id(params[:shop_id])
		if shop.present?
			shop.update(enable: params[:enable_shop])
		end
	end

	def index
	    @product_count = ShopifyAPI::Product.find(:all).count
	    if @product_count > 5
	    	@plan_activeded = ShopifyAPI::RecurringApplicationCharge.current.present?
	    	unless @plan_activeded
	    		@shop.update(enable: false)
	    	end
	    else
	    	@plan_activeded = false
	    end
	    if params.keys.include?('enable_shop') && @shop.present?
	    	@shop.update(enable: params[:enable_shop])
	    end
	end
end