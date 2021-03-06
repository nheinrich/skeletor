class CreateLibraries < ActiveRecord::Migration
  def self.up
    create_table :libraries do |t|
      t.integer :project_id
      t.integer :account_id
      t.string :name
      t.boolean :global
      t.timestamps
    end
  end

  def self.down
    drop_table :libraries
  end
end
