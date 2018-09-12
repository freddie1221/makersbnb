def clear_tables
  Property.destroy_all
  Account.destroy_all
end

def add_user_james
  account = {name: 'James', email: 'james.malvern@gmail.com', password: BCrypt::Password.create('password')}
  Account.create(account)
end

def add_property_london
  add_user_james
  james = Account.find_by(name: 'James')
  property = {location: 'London', price: 300, account_id: james.id}
end

def register
  fill_in('email', with: 'james.malvern@gmail.com')
  fill_in('name', with: 'James')
  fill_in('password', with: 'password')
  click_button 'Register'
end

def login
  fill_in('email', with: 'james.malvern@gmail.com')
  fill_in('password', with: 'password')
  click_button 'Login'
end
