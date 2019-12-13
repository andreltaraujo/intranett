class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null:false
      t.date :start_date
      t.date :end_date
      t.text :task_field
      t.integer :status, default: 0
      t.text :rmk
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
