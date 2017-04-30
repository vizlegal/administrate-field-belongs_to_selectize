# Administrate::Field::BelongsToSelectize

An [administrate](https://github.com/thoughtbot/administrate) plugin. Add
[selectize](https://selectize.github.io/selectize.js/) to belongs_to
associations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "administrate-field-belongs_to_selectize"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install administrate-field-belongs_to_selectize

## Usage

See a basic example:

```ruby
class ArticleDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    # ...
    author: Field::BelongsToSelectize.with_options(class_name: User, selectize_options: { placeholder: "Select an author" })
    # ...
  }
end
```

You can pass options to the selectized select by passing a `selectize_options`
hash to the field like in the example above. As you would imagine, javascript
functions won't work.

### Remote!

Let's say you have a select with hundreds or thousands of options. You don't
want that, don't you? Well, `administrate-field-belongs_to_selectize` comes
with a `url` option, which will let you make selectize use an API of your
choosing.

For example:

```ruby
class ArticleDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    # ...
    author: Field::BelongsToSelectize.with_options(
      class_name: User,
      url: "/api/v1/users",
      selectize_options: { placeholder: "Select an author", label_field: "name", value_field: "id", search_field: "name" }
    )
    # ...
  }
end
```

The API endpoint will be called with a `q` param which will be the query string
you'll need to use to perform the search. You can pass extra params in a `params`
hash, something like this:

```ruby
class ArticleDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    # ...
    author: Field::BelongsToSelectize.with_options(
      class_name: User,
      url: "/api/v1/users",
      params: { active: true },
      selectize_options: { placeholder: "Select an author", label_field: "name", value_field: "id", search_field: "name" }
    )
    # ...
  }
end
```

In this case, the API endpoint will receive `{ q: "your query", active: true }`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## TODO

* **TESTS**

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/patriciomacadden/administrate-field-belongs_to_selectize.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

