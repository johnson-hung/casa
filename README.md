# casa
Custom Project: Computer Architecture Student Association


## Environment Setup
```sh
rvm use 2.6.6 # uses the right version of Ruby (i.e. 2.6.6)

bundle install # installs all the app's gems

# run db migration & seed
rake db:migrate # creates a local development database and app's schema
rake db:seed    # inserts initial data into the database
```

## Misc
Run the app locally (if using AWS Cloud9)
```sh
rails s -p $PORT -b $IP
```

To make changes to migration, we have to rollback previous migration:
```sh
rake db:rollback
```
Then, edit migration and apply migration for corrected version:
```sh
rake db:migrate
```