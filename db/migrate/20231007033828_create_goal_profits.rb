class CreateGoalProfits < ActiveRecord::Migration[7.1]
  def change
    create_table :goal_profits do |t|
      t.date :registered_date
      t.references :goal, null: false, foreign_key: true
      t.integer :profit
      t.float :variation

      t.timestamps
    end
  end
end
