class Property < ApplicationRecord
    validates :name, :presence => true, :length => { :minimum => 2, :maximum => 255 }
end
