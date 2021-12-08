class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :input
      t.string :max_distance

      t.timestamps
    end

    create_table :distances do |t|
      t.references :results, index: true, foreign_key: true
      t.string :distance

      t.timestamps
    end
  end
end
