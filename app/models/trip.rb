class Trip < ApplicationRecord
    belongs_to :user, class_name: "User", foreign_key: "user_id"
    has_many :comments, class_name: "Comment", foreign_key: "trip_id"
    has_many :checkpoints, class_name: "Checkpoint", foreign_key: "trip_id"
    
end
