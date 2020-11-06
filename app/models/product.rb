class Product < ApplicationRecord
    belongs_to :collection 
    belongs_to :category
    
    serialize :stock 
    validates_uniqueness_of :name
end
