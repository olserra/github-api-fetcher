class Profile < ApplicationRecord
    has_many :comparisons

    def self.search(search)
        if !(search == "")
            github = Github.new
            github.repos.list user: search, per_page: 300
        else
            return false
        end
    end

end
