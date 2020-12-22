# README

# CloudOps

Rails API Project:-

```
.
├── app
│   ├── channels
│   │   └── application_cable
│   │       ├── channel.rb
│   │       └── connection.rb
│   ├── controllers
│   │   ├── api
│   │   │   └── v1
│   │   │       ├── services_controller.rb
│   │   │       └── service_terms_controller.rb
│   │   ├── application_controller.rb
│   │   └── concerns
│   ├── jobs
│   │   └── application_job.rb
│   ├── mailers
│   │   └── application_mailer.rb
│   ├── models
│   │   ├── application_record.rb
│   │   ├── concerns
│   │   │   └── serviceable.rb
│   │   ├── service.rb
│   │   └── service_term.rb
│   ├── views
│   │   └── layouts
│   │       ├── mailer.html.erb
│   │       └── mailer.text.erb
│   └── workers
│       └── fetch_pricing_worker.rb
├── bin
│   ├── bundle
│   ├── rails
│   ├── rake
│   ├── setup
│   └── spring
├── config
│   ├── application.rb
│   ├── boot.rb
│   ├── cable.yml
│   ├── credentials.yml.enc
│   ├── database.yml
│   ├── environment.rb
│   ├── environments
│   │   ├── development.rb
│   │   ├── production.rb
│   │   └── test.rb
│   ├── initializers
│   │   ├── application_controller_renderer.rb
│   │   ├── backtrace_silencers.rb
│   │   ├── cors.rb
│   │   ├── filter_parameter_logging.rb
│   │   ├── inflections.rb
│   │   ├── mime_types.rb
│   │   ├── sidekiq.rb
│   │   └── wrap_parameters.rb
│   ├── locales
│   │   └── en.yml
│   ├── master.key
│   ├── puma.rb
│   ├── routes.rb
│   ├── schedule.yml
│   ├── sidekiq.yml
│   ├── spring.rb
│   └── storage.yml
├── config.ru
├── db
│   ├── migrate
│   │   ├── 20201219105210_create_services.rb
│   │   └── 20201219110058_create_service_terms.rb
│   ├── schema.rb
│   └── seeds.rb
├── Gemfile
├── Gemfile.lock
├── lib
│   └── tasks
├── log
│   └── development.log
├── public
│   └── robots.txt
├── Rakefile
├── README.md
├── spec
│   ├── features
│   │   └── external_request_spec.rb
│   ├── fixtures
│   │   └── cassettes
│   │       └── cloudfront_api.rb
│   ├── models
│   │   ├── service_spec.rb
│   │   └── service_term_spec.rb
│   ├── rails_helper.rb
│   ├── requests
│   │   └── api
│   │       └── v1
│   │           └── services_request_spec.rb
│   ├── spec_helper.rb
│   ├── vcr_setup.rb
│   └── workers
│       └── fetch_pricing_worker_spec.rb
├── storage
├── test
│   ├── channels
│   │   └── application_cable
│   │       └── connection_test.rb
│   ├── controllers
│   ├── fixtures
│   │   └── files
│   ├── integration
│   ├── mailers
│   ├── models
│   └── test_helper.rb
├── tmp
│   ├── cache
│   │   ├── bootsnap-compile-cache
│   │   │   ├── 07
│   │   │   │   └── f24f68ea2abbdc
│   │   │   ├── 0a
│   │   │   │   └── 64d2507f055a8c
│   │   │   ├── 1b
│   │   │   │   └── b2094986b20162
│   │   │   ├── 8c
│   │   │   │   └── 598309e9f242be
│   │   │   ├── a8
│   │   │   │   └── b7ab6ebf772c99
│   │   │   ├── b5
│   │   │   │   └── 1b65254a108903
│   │   │   ├── cb
│   │   │   │   └── be944be5e253b8
│   │   │   └── da
│   │   │       └── 2963eeb3acb874
│   │   └── bootsnap-load-path-cache
│   ├── development_secret.txt
│   ├── pids
│   ├── restart.txt
│   ├── sockets
│   └── storage
├── vcr_cassettes
└── vendor
```

## DB Schema (PostgreSql)
### Tables

```sql

1-services   (sku,offerTermCode,effectiveDate,rateCode,description,beginRange,endRange,unit,pricePerUnit,currency_code)

2-service_terms
(sku,offerTermCode,effectiveDate,rateCode,description,beginRange,endRange,unit,pricePerUnit,currency_code)

```
## API list

All the API's are based on versioning.

# Api To Create/Add Services:-

```url  
  "/api/v1/create_service"      #add services
  params:
    sku: string
    offerTermCode: string
    effectiveDate: string
    rateCode: string
    description: string
    beginRange: string
    endRange: string
    unit: string
    pricePerUnit: string
    currency_code: string
```

# Api To Create/Add Service Terms

```url
  "/api/v1/create_service_term"
  params-
    sku: string
    offerTermCode: string
    effectiveDate: string
    rateCode: string
    description: string
    beginRange: string
    endRange: string
    unit: string
    pricePerUnit: string
    currency_code: string
```
# GET API to view pricing for a specific region:-
   Just type the location
```url
   get '/service/:servicecode/region/:location'
   EX:- "/api/v1/service/AmazonCloudFront/region/japan"
```
# With Date:-
```url
   get '/service/:servicecode/region/:location'?date=<DATE>
   EX:- "/api/v1/service/AmazonCloudFront/region/japan?date=2020-10-01T00:00:00Z"
```
#Sidekiq Worker
```
  workers
│        └── fetch_pricing_worker.rb
  (Cron Set To Run Everyday At Midnight)

  FetchPricingWorker.perform_async
```
# Rspec Test Case For 3rd Patyt Api and Worker
```rspec
Coverd api response code.

  "rspec spec/models/service_spec.rb"
  "rspec spec/workers/fetch_pricing_worker_spec.rb"
```
