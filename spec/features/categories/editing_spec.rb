require 'rails_helper'

RSpec.feature 'Category editing' do 
	let(:category) { create(:category) }

	scenario 'should be successful' do 
		visit edit_category_path(category)
		within "#edit_category_#{category.id}" do
			fill_in 'Title', with: 'New title'
			fill_in 'Description', with: 'New desc'
			click_button 'Submit!'
		end

		expect_flash 'Category New title has been updated!'
	end
end