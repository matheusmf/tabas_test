class Property < ApplicationRecord
    COVER_POSITION = 2
    validates :name, :presence => true, :length => { :minimum => 2, :maximum => 255 }

    has_many :photos, dependent: :destroy
    accepts_nested_attributes_for :photos, allow_destroy: true

    def cover
        return photos[COVER_POSITION] if photos and photos.length >= 3
    end

    def to_json
		{
            :id => self.id,
            :name => self.name,
            :created_at => self.created_at,
            :updated_at => self.updated_at,
            :cover => cover,
            :photos => self.photos
        }
    end
end
