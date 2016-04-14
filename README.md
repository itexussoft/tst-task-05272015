Task Description
----------------

1.  Write a small, portable library in Ruby 2.1. The library will batch
    convert a directory of images; they can be jpeg or png but must
    retain the aspect ratio of the original image and not discard the
    original image. This library will not use RMagick or ***ANY*** other
    Ruby gems. You will use ImageMagick 6.9.1-1 Q16 x86\_64 and the
    script should run on a UNIX based operating system.

    a.  The script you write must take only one parameter specifying the
        directory holding the images to be processed. Errors should be
        handled appropriately.

        i.  When rescuing exceptions do not \`rescue Exception =&gt;
            e\` - rescue exception by the correct exception name.

    b.  If you cannot solve this problem, detail your research and
        explain to us the reason why you could not solve the problem.
        Don’t worry if you cannot solve the problem, we are not looking
        entirely for that.

    c.  Please include links to the articles you used to research and/or
        include the page reference and name of the book you read.

2.  Our preferred databases are PostgreSQL 9.3 and for embedded systems
    we use sqlite3 without the need to install sqlite3 on the users
    operating system.

    a.  Building a multi tenant application can be solved in many ways,
        how would you approach creating a multi tenant application
        written in Rails 4.2?

    b.  Our system exposes a REST API, our API is versioned; how would
        you approach creating a versioned RESTful API?

    c.  All API responses are returned in JSON format. Create a very
        basic example of your versioned API returning one Object in JSON
        format via your exposed API. Include the example in a zip file.
        We are looking at how you approached the problem and the
        elegance of the solution.

3.  Rails 4.2 give us concerns; concerns are useful however, for
    maintenance we use a different approach, concerns within a large
    application become a maintenance nightmare. What approach would you
    use to avoid having to use Ruby mixins and avoid using
    nested\_attributes\_for in Ruby active record models?

4.  If you know C++ how would you write your GUI? Remember that we are
    concerned with maintainability and cross platform – Windows, OS X
    and Linux.

    a.  We do not use IDE’s, we like to know what we write. We use text
        editors and write our own Makefile’s. If you write C++ please
        include a Makefile that would:

        i.  Create an OS X bundle

        ii. Create a Windows executable

        iii. Include *include* and *source* directories

You have a choice of C++ frameworks, QT5 or wxWidgets 3. There are pros
and cons for each. We want our GUI to behave like a native application,
for example; when you click “x” on an OS X application the application
does not close, it just loses focus. You get the idea?

1.  Which framework gives us the native UI and which framework emulates
    the native UI?

2.  Which framework would you choose and why?

Do not take into account the colume of C++ lines you must write to
accomplish writing a GUI, that is irrelevant, as long as it behaves as
native and is cross platform – using a framework like the above saves
time having to write each executable using the operating system
available API.

If you have written a simple hello world application using either of the
frameworks, please include it and the source.

If using C++11 you may use smart pointers, and explain why you are using
smart pointers, if you don’t understand smart pointers then don’t use
the,. You should make all your constructors explicit - if you know why
we make our constructors explicit please explain otherwise research and
include your reference. And make all classes responsible for one purpose
and one purpose only.

Simplicity, Object Oriented Design and the ability to research and
explain your reasons is important for us - you should be able to explain
your decisions to someone with little programming experience and
understand your own choices completely.

You should also be able to fully understand the difference between a
scripting language and a compiled strict language and why we use both.
Python, Ruby, PHP are all written using C. Objective-C is a superset of
C therefore you can write most Objective-C programs entirely in C. We
use C and C++ for a reason; we use Ruby, as it is modular and a good
language to write maintainable applications exposing API’s. We do not
favor any language over another; they all have their weakness and
strengths.
