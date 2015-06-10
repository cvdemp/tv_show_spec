require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
    visit "/television_shows/new"
    fill_in "Title:", with: "How I Didn't Meet Your Mother"
    fill_in "Network:", with: "ABC"
    fill_in "Starting Year:", with: "2006"
    # fill_in "Ending Year:", with: "2014"
    select "Action", from: "Genre:"
    fill_in "Synopsis:", with: "Pineapples"
    click_button "Add TV Show"
    expect(page).to have_content("How I Met Your Mother")
    expect(page).to have_content("Add New Show")
  end
  scenario "fails to add a show with invalid information" do
    visit "/television_shows/new"
    click_button "Add TV Show"
    expect(page).to have_content("Add Show")
    expect(page).to have_content('["Title can\'t be blank", "Starting year can\'t be blank", "Starting year is not a number", "Network can\'t be blank"]')
  end
end
