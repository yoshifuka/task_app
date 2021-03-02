class Task < ApplicationRecord
  validates :title, :start_at, :end_at, :allday,  presence: true

end
