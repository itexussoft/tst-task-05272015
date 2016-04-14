1.  Our preferred databases are PostgreSQL 9.3 and for embedded systems
    we use sqlite3 without the need to install sqlite3 on the users
    operating system.

    a.  Building a multi tenant application can be solved in many ways,
        how would you approach creating a multi tenant application
        written in Rails 4.2?

> **Answer:** I made a research, got acquainted with
> https://quickleft.com/blog/multi-tenant-applications-separating-sql-databases/
>
> Took a look at available gems:
> https://www.ruby-toolbox.com/categories/Multitenancy, especially at
> https://github.com/influitive/apartment and
> https://github.com/dsaronin/milia.
>
> I would be using our ordinary flow for small application, it means
> shared database and authorizing with Devise since it will be cheaper
> to host, faster database access(won't have to switch connections each
> time) and authorizing logic won't be very complex.
>
> I would choose milia gem for application where tenants will have many
> users, for example when tenant is a company and employees will be a
> tenants users. Milia comes with built-in support for such cases.
>
> And if we need a tenant for each user I would use an Apartment gem. It
> seems to be growing in popularity and to be well documented, also it
> works well with postgres schemas.

a.  Our system exposes a REST API, our API is versioned; how would you
    approach creating a versioned RESTful API?

> **Answer:** I had to implement API on my previous sites. I would use
> Grape API with Roar gems to create such API, since Grape allows us to
> create versioned, well-formated and clear API and Roar allows us to
> customize representation of model and serve them in different formats.

a.  All API responses are returned in JSON format. Create a very basic
    example of your versioned API returning one Object in JSON format
    via your exposed API. Include the example in a zip file. We are
    looking at how you approached the problem and the elegance of
    the solution.

> **Answer:** I've created a sample project with one model 'Sample' and
> API, having 2 versions. API gives ability to show all samples, show
> sample by id and to create sample. I've used Grape and Roar to make it
> work. To allow us version API I added protected class method
> init\_resource, which adds our changes to a previous versions and then
> invokes super method which inits previous version. Only difference
> between versions is that v1 returns id, title and content when showing
> a sample and v2 returns only id and title.
>
> If you want to test it just unzip the project, start server and browse
> http://localhost:3001/api/v1/samples/1,
> http://localhost:3001/api/v2/samples/1,
>
> http://localhost:3001/api/v1/samples,
> http://localhost:3001/api/v2/samples.
