https://github.com/Pavling/open-data-certificate

cd odc

# issues with ruby version...

gem install therubyracer

brew install v8

#https://github.com/cowboyd/libv8
#gem install libv8 -v 3.11.8.17 -- --with-system-v8

brew install mysql

mysql.server start

bundle

rake db:create

rake db:migrate

rake db:seed

#rake surveyor:build_changed_surveys
rake surveyor:build_changed_survey FILE=surveys/odc_questionnaire.UK.rb



aasm
addressable
curb
data-kitten
surveyor
