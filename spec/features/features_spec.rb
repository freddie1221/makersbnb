feature 'home page' do
  scenario 'enters name and email address' do
    visit '/'
    fill_in('email', with: 'james.malvern@gmail.com')
    fill_in('name', with: 'James')
    click_button 'Register'
    expect(page).to have_content('Welcome to MakersBnB, James!')
  end

  scenario 'user clicks login link' do
    visit '/'
    click_link 'Login'
    expect(page).to have_content('Please login below')
  end

end

feature 'login' do
  scenario 'user enter login details' do
    visit '/login'
    fill_in('email', with: 'james.malvern@gmail.com')
    fill_in('password', with: 'password')
    click_button 'Login'
    expect(page).to have_content('Book a Property')
  end

end
