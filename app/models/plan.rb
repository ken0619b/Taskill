class Plan < ApplicationRecord
  belongs_to :task
  has_many :actions
  belongs_to :user
end
