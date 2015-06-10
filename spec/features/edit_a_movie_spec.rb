require "spec_helper"

feature "edit details on an existing tv show" do

  let(:married_with_children) { TelevisionShow.create!({
        title: "Married... with Children", network: "Fox",
        starting_year: 1987, ending_year: 1997,
        genre: "Comedy"
      }) }

  scenario "user has form populated with exisiting info" do
    married_with_children
    visit "/television_shows/#{married_with_children.id}/edit"
    expect(page).to have_content("Back to all shows")
    find_field('Title:').value.should eq "Married... with Children"
    find_field('Network:').value.should eq "Fox"
    find_field('Starting Year:').value.should eq "1987"
    find_field('Ending Year:').value.should eq "1997"
    find_field('Genre:').value.should eq "Comedy"
  end
end
