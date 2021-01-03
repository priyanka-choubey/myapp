class Article < ApplicationRecord

    belongs_to :user
    has_many :tags

    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}

    def as_json(options = {})
        super(options.merge(include: :user))
    end
end
