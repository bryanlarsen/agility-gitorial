class HoboMigrationStoryStatusModel < ActiveRecord::Migration
  def self.up
    create_table :story_statuses do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    change_column :users, :state, :string, :limit => 255, :default => "inactive"

    add_column :stories, :status_id, :integer
    remove_column :stories, :status
    add_index :stories, [:status_id]

    statuses = %w(new accepted discussion implementation user_testing deployed rejected)
    statuses.each { |status| StoryStatus.create :name => status }
  end

  def self.down
    change_column :users, :state, :string, :default => "active"

    remove_column :stories, :status_id
    add_column :stories, :status, :string
    remove_index :stories, :name => :index_stories_on_status_id

    drop_table :story_statuses
  end
end
