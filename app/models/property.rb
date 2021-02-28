class Property < ApplicationRecord
    COVER_POSITION = 2
    validates :name, :presence => true, :length => { :minimum => 2, :maximum => 255 }

    has_many :photos, dependent: :destroy

    def cover
        return photos[COVER_POSITION] if photos and photos.length >= 3
    end

end
