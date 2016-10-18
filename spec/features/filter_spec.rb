require 'spec_helper'

feature "Filtering links by tags" do

  before :each do
    Link.create(url: 'http://google.co.uk', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://bbc.co.uk', title: 'BBC', tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: 'http://bubb-bubb.co.uk', title: 'Bubb', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://bubblecompany.co.uk', title: 'B company', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'filter by tag: bubbles' do
    visit '/tags/bubbles'

    expect(page.status_code).to eq(200)
    expect(page).to have_content('Bubb')
    expect(page).to have_content('B company')
    save_and_open_page
    expect(page).not_to have_content('Google')
    expect(page).not_to have_content('BBC')

  end
end
