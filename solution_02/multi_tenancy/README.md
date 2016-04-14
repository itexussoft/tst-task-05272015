**Multi tenancy**

I found a lot of very useful articles about it and there are many gems
that provide this functionality. I like solution described here:

[*http://stackoverflow.com/questions/8432636/in-postgresql-are-partitions-or-multiple-databases-more-efficient*](http://stackoverflow.com/questions/8432636/in-postgresql-are-partitions-or-multiple-databases-more-efficient)

And I believe this gem
[*https://github.com/influitive/apartment*](https://github.com/influitive/apartment)
works in the same way. I think it's great solution but should be used
for the larger systems.

I used to work on the project that had multitenancy architecture and it
was realized with shared database and shared schema. And it was enough.

There are only several things to think about. How properly organize
access to the tenant's data in the controllers and how prevent updating
objects with ids that don't belong to their tenant.

I don't like default\_scope because of need do unscope. I think that
something like PolicyObject from here
[*http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/*](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/)
(I like this article and often use principles suggested here) will be
useful.

Want to mention that implementation should depend on requirements and
can be more difficult but as I said my implementation is the simplest
and I think is suitable for many start-ups.

Code in the attachment multi-tenancy.rb

And in the end. Because of one shared database after time passing
queries can take a lot of time. Of course at first we need to срусл
certain indexes and database engine parameters. But what if it doesn't
help? Though I've never used it in my projects, I would suggest to use
table partitioning.

[*https://github.com/fiksu/partitioned*](https://github.com/fiksu/partitioned)

[*https://blog.engineyard.com/2013/scaling-postgresql-performance-table-partitioning*](https://blog.engineyard.com/2013/scaling-postgresql-performance-table-partitioning)

Another links:

[*https://msdn.microsoft.com/en-us/library/aa479086.aspx*](https://msdn.microsoft.com/en-us/library/aa479086.aspx)

[*http://www.postgresql.org/docs/9.3/static/ddl-schemas.html*](http://www.postgresql.org/docs/9.3/static/ddl-schemas.html)

http://www.slideshare.net/tardate/multitenancy-with-rails


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

C++ part

From [*https://www.wxwidgets.org/*](https://www.wxwidgets.org/) : it
uses the platform's native API rather than emulating the GUI.

From
[*https://wiki.wxwidgets.org/WxWidgets\_Compared\_To\_Other\_Toolkits*](https://wiki.wxwidgets.org/WxWidgets_Compared_To_Other_Toolkits):
Qt doesn't have true native ports like wxWidgets does. Qt does not use
system provided widgets, but emulates it with themes. So the answer is:
<span id="__DdeLink__167_1879218532" class="anchor"></span>wxWidgets 3
gives the native UI, QT5 emulates it.

I don't know C++ but I found how to write 'Hello worl' app:
[*http://docs.wxwidgets.org/trunk/overview\_helloworld.html*](http://docs.wxwidgets.org/trunk/overview_helloworld.html)
I think there is no need to send the same but I installed wxWidgets 3
and compiled this file.

It shows empty window with title 'Hello World' on my Ubuntu. That's all
about this part.
