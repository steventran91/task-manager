class Task < ApplicationRecord
    validates :title, :status, presence: true
    validates :status, inclusion: {in: ['pending', 'in_progress', 'completed'], allow_blank: true}

end
