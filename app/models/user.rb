class User < ApplicationRecord
    has_secure_password
    has_many :rides
    has_many :attractions, :through => :rides

    def mood
        if self.happiness && self.nausea
            if self.nausea > self.happiness
                "sad"
            else
                "happy"
            end
        end
    end
    
    def num_of_rides
        self.attractions.count
    end

    def admin?
        if self.admin
            "ADMIN"
        end
    end
end
