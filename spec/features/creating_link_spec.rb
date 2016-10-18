require 'spec_helper'

feature "New link" do

  scenario 'Creating new link' do
    visit '/links/new'
    fill_in('title', with: 'Gmail')
    fill_in('URL', with: 'http://gmail.com')
    click_button('Add link')

    expect(page).to have_current_path '/links'
    expect(page).to have_content('Gmail')
  end
end
