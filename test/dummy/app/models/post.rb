class Post < ApplicationRecord
  sluggable length: 12

  def to_param
    slug
  end
end
