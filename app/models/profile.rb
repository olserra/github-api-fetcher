class Profile < ApplicationRecord

    def self.search(search)
        if !(search == "")
            github = Github.new
            github.repos.list user: search, per_page: 100
        else
            return false
        end
    end
end
