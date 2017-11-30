require 'rails_helper'

RSpec.feature 'Category deleting' do 
  let(:category) { create(:category) }

  scenario 'should be successful' do 
    visit '/categories'
    click_link 'Delete'

    expect_flash "#{category.title} has been removed!"
  end
end