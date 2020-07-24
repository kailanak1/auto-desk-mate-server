class Course < ApplicationRecord
    has_many :desks
    belongs_to :user
end
