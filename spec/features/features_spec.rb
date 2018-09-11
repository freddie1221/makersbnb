feature 'home page' do
  scenario 'enters name and email address' do
    visit '/' 
    fill_in('email', with: 'james.malvern@gmail.com')
    fill_in('name', with: 'James')
    click_button 'Register'
    expect(page).to have_content('Welcome to MakersBnB, James!') 
  end
end