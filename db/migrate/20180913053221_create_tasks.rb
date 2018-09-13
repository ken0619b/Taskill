class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :content
      t.references :user
      t.timestamp :end_date

      t.timestamps
    end
  end
end
