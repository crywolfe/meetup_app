class CreateGroupsTable < ActiveRecord::Migration
  def change
    create_table :groups_tables do |t|
      t.string :name
      t.timestamps
    end
  end
end
