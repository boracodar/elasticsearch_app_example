require 'integration_helper'

feature 'Searches', %q{
  In order to find a movie
  As a user
  I want to use the search
}, js: true do

  background :all do
    Movie.create name: 'Kill Bill'
  end

  ['Kill', 'Bill', 'kill b', 'kill bill'].each do |search_query|
    scenario "Search and find a movie with the query '#{search_query}'" do
      visit root_path
      search_for search_query
      page.should have_content('About 1 result')
    end
  end

  ['Donnie', 'Darko', 'Prometheus', 'Matrix', 'Star Wars'].each do |search_query|
    scenario "Search and not find a movie with the query '#{search_query}'" do
      visit root_path
      search_for search_query
      page.should have_content('About 0 results')
    end
  end
end
