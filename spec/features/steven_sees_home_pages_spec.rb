require 'rails_helper'

RSpec.feature "StevenSeesHomePages", type: :feature do
  scenario 'he sees a nav bar' do
    visit '/'
    expect(page).to have_nav("nav")
    expect(page).to have_content("Shredzilla")
end
end
