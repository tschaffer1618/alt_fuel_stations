require 'rails_helper'

describe 'A user' do
  scenario 'can find the nearest station with pertinent info' do
    visit '/'

    select 'Turing', from: 'location'

    click_button 'Find Nearest Station'

    expect(current_path).to eq search_path

    within('.station-info') do
      expect(page).to have_content("Seventeenth Street Plaza")
      expect(page).to have_content("1225 17th St., Denver, CO 80202")
      expect(page).to have_content("Hours of Service: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
      expect(page).to have_content("Distance: 0.0934 mi")
      expect(page).to have_content("Fuel Type: ELEC")
    end

    within('.route-info') do
      expect(page).to have_content("Distance: 0.1 mi")
      expect(page).to have_content("Time: 1 min")
      expect(page).to have_content("Steps: Head <b>southeast</b> on <b>17th St</b> toward <b>Larimer St</b>")
    end
  end
end
