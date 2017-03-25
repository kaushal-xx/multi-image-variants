class CustomScriptsController < ApplicationController
	skip_before_action :verify_authenticity_token

  def product_variant
    respond_to do |format|
      format.html { }
      format.json { }
      format.js { }
    end
  end

end