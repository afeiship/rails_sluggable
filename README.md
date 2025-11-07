# RailsSluggable
> A Rails plugin for generating configurable model slugs.

## Usage
```rb
# generate slug for `Posts`
rails generate migration AddSlugToPosts slug:string:uniq

class Post < ApplicationRecord
  sluggable length: 12
end

class Article < ApplicationRecord
  sluggable length: 8, separator: '-'
end
```

## Example
> Use slug for post model.
```json
{
  "id": 1,
  "content": "Ruby on Rails 是一个强大的 Web 开发框架...",
  "created_at": "2025-11-07T06:48:29.259Z",
  "slug": "077f802de102",
  "title": "Rails 入门指南",
  "updated_at": "2025-11-07T06:48:29.259Z"
}
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "rails_sluggable"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install rails_sluggable
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
