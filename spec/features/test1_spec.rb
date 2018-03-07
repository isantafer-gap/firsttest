require 'spec_helper'

feature "Demo Fasttrack", :js => true do 
  
  given (:hi) { 'Hi Folks! This is working' }

  scenario "Scenario FT" do
    visit('/')
    fill_in('lst-ib', :with => hi)
    sleep(15)
  end
end