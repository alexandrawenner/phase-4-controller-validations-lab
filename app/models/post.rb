class Post < ApplicationRecord
    validates :title, :category, inclusion: {in: ["Fiction", "Non-Fiction"]}, :content, length: { minimum: 100 }

end