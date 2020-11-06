class Collection < ApplicationRecord
    has_many :products
    has_many :categories, through: :products
    
    validates_uniqueness_of :name
end
