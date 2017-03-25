ShopifyApp.configure do |config|
  config.application_name = "Multi Image Variant"
  config.api_key = ENV["shopify_api_key"]
  config.secret = ENV["shopify_secret"]
  config.scope = "read_script_tags, write_script_tags, read_products"
  config.embedded_app = true	
  config.scripttags = [
    {event:'onload', src: "https://multi-image-variants.herokuapp.com/product_variants.js", format: "script"}
  ]
  config.webhooks = [
    {topic: 'app/uninstalled', address: "https://multi-image-variants.herokuapp.com/app_uninstall", format: "json"}
  ]
end
