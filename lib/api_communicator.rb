require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  character_response_string = RestClient.get('http://www.swapi.co/api/people/')
  character_response_hash = JSON.parse(character_response_string)
  
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  
  character_film_urls = character_response_hash["results"][0]["films"]
  sorted_character_film_urls = character_film_urls.sort
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  character_films = []
  sorted_character_film_urls.each do |film_url|
    film_response_string = RestClient.get(film_url)
    film_response_hash = JSON.parse(film_response_string)
    # binding.pry
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
    character_film = film_response_hash.slice("title", "episode_id", "release_date", "director")
    character_films << character_film
  end
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  return character_films
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  puts "-----"
  films.each do |film|
    puts "Star Wars Episode #{film['episode_id']}: #{film['title']}"
    puts "Released #{film['release_date']} and directed by #{film['director']}"
    puts "-----"
    sleep(0.5)
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  # binding.pry
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
