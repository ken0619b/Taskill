class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :content
      t.string :is_done

      t.timestamps
    end
  end
end
