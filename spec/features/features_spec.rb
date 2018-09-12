feature 'home page' do
  scenario 'enters name and email address' do
    visit '/'
    expect(page).to have_content('Please fill in the registration form below')
    fill_in('email', with: 'james.malvern@gmail.com')
    fill_in('name', with: 'James')
    click_button 'Register'
    expect(page).to have_content('Book a Property')
  end

  scenario 'user clicks login link' do
    visit '/'
    click_link 'Login'
    expect(page).to have_content('Please login below')
  end

end

feature 'login' do
  scenario 'user enters login details' do
    visit '/login'
    expect(page).to have_content('Please login below')
    fill_in('email', with: 'james.malvern@gmail.com')
    fill_in('password', with: 'password')
    click_button 'Login'
    expect(page).to have_content('Book a Property')
  end

  feature 'property' do
    scenario 'user clicks the \'List a Property\' button' do
      visit '/properties'
      expect(page).to have_content('Book a Property')
      click_button 'List a Property'
      expect(page).to have_content('Please fill in the property form below')
    end
  end

  feature 'show properties' do
    scenario 'user clicks the \'Show Properties\' button' do
      visit '/properties'
      expect(page).to have_content('Book a Property')
      fill_in('date_from', with: '22/09/2018')
      fill_in('date_to', with: '24/09/2018')
      click_button 'Show Properties'
      expect(page).to have_content('Book a Property')
    end
  end

#  feature 'create a property' do
#   scenario 'user enters property details' do
#     visit '/properties/new'
#     fill_in('name', with: 'Mal Cottage')
#     fill_in('description', with: 'palacious')
#     fill_in('price_per_night', with: '3')
#     fill_in('available_from', with: '25/12/18')
#     fill_in('available_to', with: '26/12/18')
#     click_button 'List my Property'
#     expect(page).to have_content('Mal Cottage')
#     expect(page).to have_content('palacious')
#     expect(page).to have_content('3')
#     expect(page).to have_content('25/12/18')
#     expect(page).to have_content('26/12/18')
#   end
#  end

end
