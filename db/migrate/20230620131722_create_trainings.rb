class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :training_name,      null: false
      t.integer    :weight,             null: false
      t.integer    :number,             null: false
      t.timestamps
    end
  end
end
