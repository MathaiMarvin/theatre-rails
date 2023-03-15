class Production < ApplicationRecord
    has_many :crew_members

    # To validate our data we use the validate built in method
    validates :title, presence: true

    # Creating custom validations
    # WE use validate not validates

    validate :no_more_musicals

    def no_more_musicals
        #   We use an if statement
        if genre.downcase == "musical"
            # We add our own custom error message to the errors method for the genre only
            errors.add(:genre, "Sorry no more musicals!")
        end
    end

    def title_director
        "#{title}: #{director}"
    end
end
