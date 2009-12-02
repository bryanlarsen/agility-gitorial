class TasksController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index

  auto_actions_for :story, :create

end
