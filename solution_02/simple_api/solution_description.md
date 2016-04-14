Create a versioned RESTful API

I like gem 'grape' https://github.com/intridea/grape

and I would use it to create a versioned RESTful API for a real usage.

It's lightweight, provides a simple DSL, content negotiation, versioning
and I don't have to use Rails because grape designed to run on Rack or
complement existing web application frameworks. It's so common
requirements for the API that there is no need to reinvent the wheel and
wrtite it all by hands.

Moreover it's often needed to authenticate users and it would be even
better if using OAuth 2(in my opinion). We also have nice gems that
helps to use it for our API:
[*https://github.com/doorkeeper-gem/doorkeeper*](https://github.com/doorkeeper-gem/doorkeeper)

[*https://github.com/fuCtor/grape-doorkeeper*](https://github.com/fuCtor/grape-doorkeeper)

My API in the 'lib' folder. I use 'grape' mentioned above. I wanted to
show its simple but powerful DSL.

Other links:

http://railscasts.com/episodes/350-rest-api-versioning?view=asciicast

[*https://www.airpair.com/ruby-on-rails/posts/building-a-restful-api-in-a-rails-application*](https://www.airpair.com/ruby-on-rails/posts/building-a-restful-api-in-a-rails-application)

https://github.com/rails-api/rails-api/tree/master/lib/rails-api/generators/rails/app
