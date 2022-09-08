class Comment < ApplicationRecord
    belongs_to :trip, class_name: "Trip", foreign_key: "trip_id"
    
    belongs_to  :parent, class_name: 'Comment', optional: true
    has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
    validates :body, presence: true
end
