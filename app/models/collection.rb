class Collection < ApplicationRecord
    validates_uniqueness_of :name
end
