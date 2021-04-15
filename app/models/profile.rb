class Profile < ApplicationRecord

    def self.search(search)
        if !search.nil?
            Github.repos.list user: search
        end
    end
end
