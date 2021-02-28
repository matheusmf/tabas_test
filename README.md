# tabas_test
## Tabas Practical Exercises

**Instructions for avaliation:**

Please execute these comands below.
- bundle install
- rake db:migrate
- rake db:seed


**Exercise 1: algorithm**

Option 1

The solution is on method from_integer of class RomanNumeral (app/models/roman_numeral.rb).

The test is in test/models/roman_numeral_test.rb

Please execute bin/rails test test/models/roman_numeral_test.rb command.

Option 2

The solution is on method from_integer of class WordInteger (app/models/word_integer.rb).

The test is in test/models/word_integer_test.rb.

Please execute bin/rails test test/models/word_integer_test.rb command.


**Exercise 2: Ruby App**

Backend

The Property model is in app/models/property.rb and the Photo model is in app/models/photo.rb.

The test of Property model is in test/models/property_test.rb. Please execute bin/rails test test/models/property_test.rb command.

The endpoints to create, update, show and list properties are in app/controllers/properties_controller.rb

The rake db:seed comand requested in the instructions is creating 50 properties specified in db/seeds.rb. 


**Exercise 4: Backend**
