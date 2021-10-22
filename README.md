# Contractor application

This is a event driven application which uses `RabbitMQ` and `Bunny` plugin for publishing and accepting messages. Contractor can request a payment from their manager. A payment request consists of amount, currency, and text description. Contractor can see all of their payment requests, whether they're pending, accepted, or rejected. This application uses 

## Getting started


To get started with the app, first clone the repo and `cd` into the directory:

```
$ git clone https://github.com/jainaayush/contractor_app.git
$ cd contractor
```

Then install the needed gems:

```
$ bundle install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the server:

```
$ rails server
```
This uses `RabbitMQ` so we need to setup rabbitmq server at development sert but currently the app uses the cloudamqp RabbitMq cloud server URL so we can skip the installation at local.
