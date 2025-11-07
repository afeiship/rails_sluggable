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
