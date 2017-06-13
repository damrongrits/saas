require 'spec_helper'
require 'rails_helper'

describe Movie do
  describe 'searching Tmdb by keyword' do
    context 'with valid API key' do
      it 'should call Tmdb with title keywords' do
        expect(Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
    end
    context 'with invalid API key' do
      before :each do
        expect(Tmdb::Movie).to receive(:find).and_raise(NoMethodError)
        expect(Tmdb::Api).to receive(:response).and_return({'code' => '401'})
      end
      it 'should raise an InvalidKeyError with no API key' do
        expect(lambda { Movie.find_in_tmdb('Inception') }).
          to raise_error(Movie::InvalidKeyError)
      end
    end
  end
end

# describe Movie do
#   describe 'searching Tmdb by keyword' do
#     # it 'should call Tmdb with title keywords' do
#     #     # Tmdb:expect(Movie).to receive(:find).with('Inception')
#     #   # TmdbMovie.should_receive(:find).with(hash_including :title => 'Inception')
#     #   Tmdb::Movie.should_receive(:find).with('Inception')
#     #   Movie.find_in_tmdb('Inception')
#     # end
#     it 'should call Tmdb with title keywords given valid API key' do
#       Tmdb::Movie.should_receive(:find).with('Inception')
#       Movie.find_in_tmdb('Inception')
#     end
#     it 'should raise an InvalidKeyError with no API key' do
#       Tmdb::Movie.stub(:find).and_raise(NoMethodError)
#       Tmdb::Api.stub(:response).and_return({'code' => '401'})
#       lambda { Movie.find_in_tmdb('Inception') }.
#         should raise_error(Movie::InvalidKeyError)
#     end
#   end
# end
