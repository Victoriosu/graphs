class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :name

      t.timestamps
    end
  end
end
