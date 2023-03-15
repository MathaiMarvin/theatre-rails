class Production < ApplicationRecord
    has_many :crew_members

    def title_director
        "#{title}: #{director}"
    end
end
