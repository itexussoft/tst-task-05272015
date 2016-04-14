**How to avoid using nested_attributes_for in Ruby active record models**

In this article
[*http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/*](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/)
one approach is already shown. It's clean and works well but in this
case I need to duplicate validations that I suppose Company and User
modes already have. So I would use another approach. Attachment in
signup.rb

It's simple, I don't need to use another gem and duplicate something.

Regarding to mixins, I don't think that they are always nightmare. I
think when we need to share behaviors between different classes we can
use them. But when we just need to extract some logic or simplify it we
shouldn't use mixins. I would write another class and use it's
instances.

[*http://matt.aimonetti.net/posts/2012/07/30/ruby-class-module-mixins/*](http://matt.aimonetti.net/posts/2012/07/30/ruby-class-module-mixins/)

http://blog.steveklabnik.com/posts/2012-05-07-mixins--a-refactoring-anti-pattern
