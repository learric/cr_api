class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :school
      t.integer :teacher_id

      t.timestamps null: false
    end
  end
end
