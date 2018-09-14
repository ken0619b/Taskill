class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :comment
      t.references :task
      t.references :user

      t.timestamps
    end
  end
end
