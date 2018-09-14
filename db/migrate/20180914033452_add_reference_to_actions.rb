class AddReferenceToActions < ActiveRecord::Migration[5.2]
  def change
    add_reference :actions, :plan
  end
end
