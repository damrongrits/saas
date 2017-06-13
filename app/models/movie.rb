class Movie < ActiveRecord::Base
  class Movie::InvalidKeyError < StandardError ; end
    attr_accessible :title, :rating, :description, :release_date

    def self.all_ratings ; %w[G PG PG-13 R NC-17] ; end #  shortcut: array of strings

    def released_1930_or_later
      errors.add(:release_date, 'must be 1930 or later') if
        release_date && release_date < Date.parse('1 Jan 1930')
    end

    def grandfathered?
      release_date && release_date >= @@grandfathered_date
    end

    before_save :capitalize_title
    def capitalize_title
      self.title = self.title.split(/\s+/).map(&:downcase).
        map(&:capitalize).join(' ')
    end

    # def self.api_key
    #   "c7f087df859a16ff461c1eb351d13049"
    # end

    def self.find_in_tmdb(string)
      begin
      Tmdb::Movie.find(string)
      rescue ArgumentError => tmdb_error
        raise Movie::InvalidKeyError, tmdb_error.message
      # below deprecated due to tmdb api update
      rescue RuntimeError => tmdb_error
       if tmdb_error =~ /status code '404'/
         raise Movie::InvalidKeyError, tmdb_error.message
       else
         raise RuntimeError, tmdb_error.message
       end
      rescue NoMethodError => tmdb_gem_exception
       if Tmdb::Api.response['code'] == '401'
         raise Movie::InvalidKeyError, 'Invalid API key'
       else
         raise tmdb_gem_exception
       end
      end
    end

    # def name_with_rating
    # end
end
