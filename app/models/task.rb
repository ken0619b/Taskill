class Task < ApplicationRecord
  has_many :actions
  belongs_to :user
end
