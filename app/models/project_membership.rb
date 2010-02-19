class ProjectMembership < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    timestamps
  end

  belongs_to :project
  belongs_to :user

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator? || project.owner_is?(acting_user)
  end

  def update_permitted?
    acting_user.administrator? || project.owner_is?(acting_user)
  end

  def destroy_permitted?
    acting_user.administrator? || project.owner_is?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end
