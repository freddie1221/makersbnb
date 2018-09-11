

feature 'home page' do
  scenario 'enters name and email address' do
    visit '/' 
    fill_in('email', with: 'james.malvern@gmail.com')
    fill_in('name', with: 'james')
    click_button 'Register'
    expect(page).to have_content('hello world') 
  end
end