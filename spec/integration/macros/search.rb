module IntegrationHelpers
  def search_for(word)
    within 'form#search' do
      fill_in 'search_query', with: word
      click_button 'Search'
    end
  end

  def delete_movie_index
    Tire.index(index_name) do
      delete
      refresh
    end
  end

  private

  def index_name
    "#{Tire::Model::Search.index_prefix}movies"
  end
end
