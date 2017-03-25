class HomeController < ShopifyApp::AuthenticatedController

  def index
    current_domain = ShopifyAPI::Shop.current
    @shop = Shop.find_by_shopify_domain(params[:shop]||current_domain.domain)
    @product_count = ShopifyAPI::Product.find(:all).count
    if @shop.present?
      if @product_count > 5
        @plan_activeded = ShopifyAPI::RecurringApplicationCharge.current.present?
        unless @plan_activeded
          @shop.update(enable: false)
        end
      else
        @plan_activeded = false
      end
      if params.keys.include?('enable_shop')
        @shop.update(enable: params[:enable_shop])
      end
    end
  end

  def plan_active
      # checks to see if there is already an RecurringApplicationCharge created and activated
      @url = root_path
      unless ShopifyAPI::RecurringApplicationCharge.current
        recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.new(
                name: "Unlimited Plan",
                price: 0.5,
                return_url: "https://multi-image-variants.herokuapp.com/activatecharge",
                test: true,
                trial_days: 7,
                terms: "$0.5 for unlimited product")

        # if the new RecurringApplicationCharge saves,redirect the user to the confirmation URL,
        # so they can accept or decline the charge
        if recurring_application_charge.save
          @url = recurring_application_charge.confirmation_url
        end
      end
  end 

  def activatecharge
    # store the charge_id from the request
    recurring_application_charge = ShopifyAPI::RecurringApplicationCharge.find(request.params['charge_id'])
    if recurring_application_charge.status == "accepted"
    	recurring_application_charge.activate
    end
    redirect_to root_path
  end 

end
