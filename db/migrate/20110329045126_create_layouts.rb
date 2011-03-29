class CreateLayouts < ActiveRecord::Migration
  def self.up
    create_table :layouts do |t|
      t.integer :project_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :layouts
  end
end
