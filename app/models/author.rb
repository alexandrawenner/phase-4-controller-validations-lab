class Author < ApplicationRecord
    validates :name, :email, uniqueness: true 
end
