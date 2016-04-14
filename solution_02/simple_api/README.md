## Installation

Install the `grape` gem:

    gem install grape

Cd to lib folder and run:

    `rackup config.ru`

Now you will be able to send requests to the server.

It's RESTful API for the User model, user has two fields: id and name.

Example with curl(you should pass the desired version in the HTTP `Accept` head).

    curl -d "id=1&name=Joey" -H Accept:application/vnd.project-v1+json http://localhost:9292/api/users

    curl -d "id=2&name=Kate" -H Accept:application/vnd.project-v1+json http://localhost:9292/api/users

    curl -H Accept:application/vnd.project-v1+json http://localhost:9292/api/users

    curl -d name=Jo -X PUT -H Accept:application/vnd.project-v1+json http://localhost:9292/api/users/1

    curl -X DELETE -H Accept:application/vnd.project-v1+json http://localhost:9292/api/users/1

    curl -X DELETE -H Accept:application/vnd.project-v1+json http://localhost:9292/api/users/3


Or using Postman for Chrome.
