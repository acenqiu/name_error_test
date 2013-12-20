# Steps

The following steps demostrate how to re-produce the NameError.

## Setup Env

### 1. Clone the project

    git clone https://github.com/acenqiu/name_error_test.git


### 2. Bundle install & Create the production database


    bundle install
    rake db:create RAILS_ENV=production

  
### 3. Run the production console to check everything is right

    rails console production
  
## Reproduce
  
### comment out one line in `application_controller.rb`, and it should raise the NameError

Edit the file `application_controller.rb`, comment out following line.

    # rescue_from ActiveRecord::RecordInvalid, with: :show_errors
  
Run the production console again.

    rails c production
  
And you should see the error raised.

    ~/Documents/name_error_test/app/controllers/application_controller.rb:6:in `<class:ApplicationController>': uninitialized constant ActiveRecord::RecordInvalid (NameError)

## What I know

If we disable eager_load in production.rb, everything is fine, but this is not what I want. No matter which action controller I put the `rescue_from ActiveRecord::RecordInvalid` in, the error still exists.

`rescue_from ActiveRecord::RecordNotFound` will survive from this error.
