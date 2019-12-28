# Provided, don't edit
require 'directors_database'
require 'pry'

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
    grand_movies = []
      index = 0 
        while index < directors_database.length do
          push.directors_database
    
      end 
      grand_movies
   end
 
  

def movies_with_director_key(name, movies_collection)

    grand_movies = []
      index = 0 
        while index < movies_collection.length do
          grand_movies.push(movie_with_director_name(name, movies_collection[index]))
      index += 1
    end 
      grand_movies
   end
 
 
 
def gross_per_studio(collection)
   
    studio_gross = 0
     final_list = {}
     i = 0
      while i < collection.length do
       # binding.pry
        
        
        if final_list.has_key?  collection[i][:studio] 
            final_list[collection[i][:studio]] += collection[i][:worldwide_gross ]
          else 
              final_list[collection[i][:studio]] = collection[i][:worldwide_gross ]

        
    
        end
       i += 1
      end
    final_list
   end 
 
 
  

def movies_with_directors_set(source)
 #binding.pry
  i = 0 
   new_mov_arr = []
    
       while i < source.length do
         name = source[i][:name]
          mov = source[i][:movies]
        
     array = movies_with_director_key(name, mov)
  new_mov_arr.push(array)
        #binding.pry

         
         
           i += 1
        end
     new_mov_arr
   end
 
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


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
