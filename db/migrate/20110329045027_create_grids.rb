class CreateGrids < ActiveRecord::Migration
  def self.up
    create_table :grids do |t|
      t.integer :project_id
      t.integer :columns
      t.string :width
      t.string :gutter_width
      t.timestamps
    end
  end

  def self.down
    drop_table :grids
  end
end
