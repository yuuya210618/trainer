class CreateCalories < ActiveRecord::Migration[6.0]
  def change
    create_table :calories do |t|
      t.references :user,               null: false, foreign_key: true
      t.integer    :calories_intake,    null: false
      t.datetime   :start_time
      t.timestamps
    end
  end
end
