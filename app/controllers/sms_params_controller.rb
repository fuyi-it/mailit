class SmsParamsController < ApplicationController

  hobo_model_controller

  auto_actions :all


  auto_actions_for :adapter,[ :index, :new, :create ]

end
