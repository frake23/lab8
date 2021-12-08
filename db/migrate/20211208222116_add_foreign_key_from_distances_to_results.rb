class AddForeignKeyFromDistancesToResults < ActiveRecord::Migration[6.1]
  def change
    add_column :distances, :result_id, :integer
    add_foreign_key :distances, :results
  end
end
