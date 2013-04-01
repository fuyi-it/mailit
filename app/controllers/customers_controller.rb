class CustomersController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def assing_tags
  	params["customer"]["tags"] =  params["customer"]["tagstring"].split(' ').collect{ |tag|
      '@' + Tag.find_or_create_by_name(tag.strip).id.to_s
  	} 
  end

  def create
  	assing_tags
  	hobo_create
  end

  def update
  	assing_tags
  	hobo_update
  end

end
