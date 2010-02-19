class ProjectsController < ApplicationController

  hobo_model_controller

  auto_actions :show, :edit, :update, :destroy

  auto_actions_for :owner, [:new, :create]

  def show
    @project = find_instance
    @stories =
      @project.stories.apply_scopes(:search    => [params[:search], :title],
                                    :status_is => params[:status],
                                    :order_by  => parse_sort_param(:title, :status))
  end

end
