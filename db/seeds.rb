
Property.destroy_all
Account.destroy_all

accounts = [
  {name: 'Malachy Gilchrist', email: 'scarfsniffer@gmail.com'},
  {name: 'James Malvern',     email: 'ilovekongee@yahoo.co.uk'}
]

accounts.each do |account|
  Account.create(account)
end

mal = Account.find_by(email: 'scarfsniffer@gmail.com')
james = Account.find_by(email: 'ilovekongee@yahoo.co.uk')


properties = [
  {name: 'London', price: 1000, account_id: mal.id },
  {name: 'Brighton', price: 700, account_id: james.id }
]

properties.each do |property|
  Property.create(property)
end
