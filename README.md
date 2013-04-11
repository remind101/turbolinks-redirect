# Turbolinks::Redirect

Simple `redirect_to` support for [turbolinks][turbolinks] and
[jquery-rails][jquery-rails].

## Installation

Add this line to your application's Gemfile:

    gem 'turbolinks-redirect'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install turbolinks-redirect

## Usage

This approach assumes that you are trying to get turbolinks to play nice
with rails_ujs and want your ajax forms to be able to "redirect" on success.

Simply require `turbolinks.redirect` in your javascripts:

``` javascript
//= require turbolinks
//= require turbolinks.redirect
```

Now, write your controller actions as you normally would:

``` ruby
class PostsController < ActionController::Base

  def create
    @post = Post.new params[ :post ]
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
end
```

Under the hood, `redirect_to` checks to see if the request is an XHR. If
it is, instead of responding with a 3xx status code, it responds with a
custom 2xx status code, still setting the Location header.

Then, a handler is attached to the rails_ujs "ajax:success" event. It
checks for this particular status code, and if it finds it, tells
turbolinks to visit the page located in the header.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[turbolinks]: https://github.com/rails/turbolinks/
[jquery-rails]: https://github.com/rails/jquery-rails
