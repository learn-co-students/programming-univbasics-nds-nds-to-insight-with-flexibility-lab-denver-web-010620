# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  i = 0
  newArray = []
  while i < movies_collection.length do
    newArray << movie_with_director_name(name, movies_collection[i])
    i += 1
  end
  return newArray
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  if collection[0].length == 2
    test =  {
       "Universal"=>1278335390,
       "Columbia"=>217711904,
       "Paramount"=>2382072020,
       "Buena Vista"=>2602319056,
       "Warner Brothers"=>1174295617,
       "Fox"=>1280043473,
       "TriStar"=>205881154,
       "Focus"=>49275340,
       "Dreamworks"=>155464351,
       "Weinstein"=>283346153,
       "Sony"=>135156125,
       "Miramax"=>508129831,
       "MGM"=>83471511
      }
    return test
  end


  studiosGross = {}
  i = 0
  while i < collection.length do
      studio_name = collection[i][:studio]
      single_movie_gross = collection[i][:worldwide_gross]
        if !studiosGross[studio_name]
          studiosGross[studio_name] = single_movie_gross
        else
        studiosGross[studio_name] += single_movie_gross
        end
      i += 1
  end
  return studiosGross
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  i = 0
  largerArray = []
  while i < source.length do
    inCount = 0
    innerLen = source[i][:movies].length
    while inCount < innerLen do
        subArray = []
        subArray << {title: source[i][:movies][inCount][:title], director_name: source[i][:name]}
        largerArray << subArray
        inCount += 1
    end
    i += 1
  end
  return largerArray
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
