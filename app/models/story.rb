class Story < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    title  :string
    body   :markdown # or :textile
    timestamps
  end

  belongs_to :project
  belongs_to :status, :class_name => "StoryStatus"

  has_many :tasks, :dependent => :destroy, :order => :position

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.signed_up? && !project_changed?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
