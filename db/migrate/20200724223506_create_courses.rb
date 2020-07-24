class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
