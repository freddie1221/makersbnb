accounts = [
  {name: 'Malachy Gilchrist', email: 'scarfsniffer@gmail.com'},
  {name: 'James Malvern',     email: 'ilovekongee@yahoo.co.uk'}
]

accounts.each do |account|
  Account.create(account)
end
