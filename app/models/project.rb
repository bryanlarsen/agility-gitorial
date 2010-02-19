class Project < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    timestamps
  end

  has_many :stories, :dependent => :destroy
  has_many :memberships, :class_name => "ProjectMembership", :dependent => :destroy
  has_many :members, :through => :memberships, :source => :user

  belongs_to :owner, :class_name => "User", :creator => true

  # --- Permissions --- #

  def create_permitted?
    owner_is? acting_user
  end

  def update_permitted?
    acting_user.administrator? || (owner_is?(acting_user) && !owner_changed?)
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end
