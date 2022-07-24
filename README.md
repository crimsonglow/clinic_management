Setup:
bundle install
bundle exec rake db:migrate 
bundle exec rake assets:precompile
bundle exec rake db:test:prepare
bundle exec rake db:seed
