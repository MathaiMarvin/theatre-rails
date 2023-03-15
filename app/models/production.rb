class Production < ApplicationRecord
    has_many :crew_members

    # To validate our data we use the validate built in method
    validates :title, presence: true

    def title_director
        "#{title}: #{director}"
    end
end
