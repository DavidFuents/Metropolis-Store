class Category < ApplicationRecord
    has_many :products
    has_many :collections, through: :products
    
    validates_uniqueness_of :name
end
