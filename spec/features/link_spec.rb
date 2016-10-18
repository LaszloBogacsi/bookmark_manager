
require 'spec_helper'

RSpec.feature "link management", :type => :feature do
  scenario "view links" do
    Link.create(url: "www.google.co.uk", title: "Google")
    visit "/links"

    expect(page).to have_text("Google")
  end
end
