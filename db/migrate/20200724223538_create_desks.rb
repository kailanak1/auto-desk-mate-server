class CreateDesks < ActiveRecord::Migration[6.0]
  def change
    create_table :desks do |t|
      t.string :student_name
      t.integer :course_id

      t.timestamps
    end
  end
end
