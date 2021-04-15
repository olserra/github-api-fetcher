class Profile < ApplicationRecord

    def self.search(search)
        if !(search == "")
            Github.repos.list user: search            
        else
            return false
        end
    end
end
