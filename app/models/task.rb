class Task < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    description :string
    timestamps
  end

  belongs_to :story

  has_many :task_assignments, :dependent => :destroy
  has_many :users, :through => :task_assignments

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.signed_up?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
