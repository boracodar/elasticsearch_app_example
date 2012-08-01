module IntegrationHelpers
  def search_for(word)
    within 'form#search' do
      fill_in 'search_query', with: word
      click_button 'Search'
    end
  end

  def delete_movie_index
    Movie.index.delete
  end
end
