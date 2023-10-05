class CreateGraphs < ActiveRecord::Migration[7.1]
  def change
    create_table :graphs do |t|
      t.string :name
      t.integer :list_order

      t.timestamps
    end
  end
end
