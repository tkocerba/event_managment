require 'rails_helper'

RSpec.feature 'Registration new user' do
  scenario 'should be successfull' do 
    visit new_user_path
    within '#new_user' do 
        fill_in 'Name', with: 'Test'
        fill_in 'Email', with: 'test@test.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Register'
    end

    expect_flash 'Welcome Test!'
  end
end