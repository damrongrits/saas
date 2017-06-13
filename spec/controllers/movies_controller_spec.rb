require 'spec_helper'
require 'rails_helper'

describe MoviesController do

  describe 'searching TMDb' do
    before :each do
      @fake_results = [double('movie1'), double('movie2')]
    end
    it 'should call the model method that performs TMDb search' do
      allow(Movie).to receive(:find_in_tmdb).with('hardware').and_return(@fake_results)
      # expect(Movie).to receive(:find_in_tmdb).with('hardware').and_return(@fake_results)  # from should
      post :search_tmdb, {:search_terms => 'hardware'}
    end
    it 'should select the Search Results template for rendering' do
      allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)  # from stub
      post :search_tmdb, {:search_terms => 'hardware'}
      expect(response).to render_template('search_tmdb')                # from should
    end
    it 'should make the TMDb search results available to that template' do
      allow(Movie).to receive(:find_in_tmdb).and_return(@fake_results)    # from stub
      post :search_tmdb, {:search_terms => 'hardware'}
      expect(assigns(:movies)).to eq(@fake_results)
    end
  end
  
end
