
Property.destroy_all
Account.destroy_all

accounts = [
  {name: 'Malachy Gilchrist', email: 'scarfsniffer@gmail.com'},
  {name: 'James Malvern',     email: 'ilovekongee@yahoo.co.uk'}
]


properties = [
  {location: 'London', price: 1000, account_id: 1 },
  {location: 'Brighton', price: 700, account_id: 1 }
]

accounts.each do |account|
  Account.create(account)
end


properties.each do |property|
  Property.create(property)
end