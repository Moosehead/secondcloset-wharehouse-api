# secondcloset-wharehouse-api
Backend asssesment for second closet

# Setup
1. Navigate to root directory and run `bundle install` to install all the gems

# Start server (locally)
1. To run rails server `rails s` (default running on http://127.0.0.1:3000/) 

# To run Tests 
1. To run tests`bundle exec rspec`

# API URLS
1. POST `/api/customer/create` Creates customer 
- body payload example according to the assessment
`{
    "name":"A",
    "discount":[ {"value":"0.10","quantity":"-1"}]
}`
`{
    "name":"B",
    "charge_volume":"1"
}`
`{
    "name":"C",
    "charge_value":"0.05"
}`
`{
    "name":"D",
    "discount":[{"value":"0.05","quantity":"2"},
                {"value":"0.10","quantity":"2"},
                {"value":"0.15","quantity":"-1"}],
    "charge_volume":"2"
}`
2. POST `/api/customer/fee` Update new fee
- body payload example
`{"value":"20"}`

3. POST `/api/customer/add/:customer_id` Get quote of items for customer with ID in the url
- body payload example
` {"items":[{"name":"Fridge","length":"3","height":"16","width":"4","weight":"300","value":"1000"},
            {"name":"Sofa","length":"6","height":"4","width":"3","weight":"100","value":"500"},
            {"name":"Fridge","length":"3","height":"16","width":"4","weight":"300","value":"1000"},
            {"name":"Sofa","length":"6","height":"4","width":"3","weight":"100","value":"500"}]}`

4. GET `/api/customer/list` Get list of all customers 
