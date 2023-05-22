class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :due_date
      t.string :priority
      t.string :status
      t.belongs_to :user

      t.timestamps
    end
  end
end
