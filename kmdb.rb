# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
    Movie.destroy_all
    Actor.destroy_all

# Generate models and tables, according to the domain model.
t.string "title"
t.string "studio"
t.integar "year_released"
t.string "ratings"

t.integar "movie_id"
t.string "actor_name"
t.string "character_name"

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
movie_1 = Movie.new
movie_1["title"] = "Batman Begins"
movie_1["studio"] = "Warner Bros."
movie_1["year_released"] = "2005"
movie_1["ratings"] = "PG-13"
movie_1.save

movie_2 = Movie.new
movie_2["title"] = "The Dark Knight"
movie_2["studio"] = "Warner Bros."
movie_2["year_released"] = "2008"
movie_2["ratings"] = "PG-13"
movie_2.save

movie_3 = Movie.new
movie_3["title"] = "The Dark Knight Rises"
movie_3["studio"] = "Warner Bros."
movie_3["year_released"] = "2012"
movie_3["ratings"] = "PG-13"
movie_3.save

series_1 = Movie.find_by({ "title" => "Batman Begins" })
actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor["character_name"] = "Bruce Wayne"
actor["movie_id"] = series_1["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Michael Caine"
actor["character_name"] = "Alfred"
actor["movie_id"] = series_1["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Liam Neeson"
actor["character_name"] = "Ra's Al Ghul"
actor["movie_id"] = series_1["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Katie Holmes"
actor["character_name"] = "Rachel Dawes"
actor["movie_id"] = series_1["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Gary Oldman"
actor["character_name"] = "Commissioner Gordon"
actor["movie_id"] = series_1["id"]
actor.save

series_2 = Movie.find_by({ "title" => "The Dark Knight" })
actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor["character_name"] = "Bruce Wayne"
actor["movie_id"] = series_2["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Heath Ledger"
actor["character_name"] = "Joker"
actor["movie_id"] = series_2["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Aaron Eckhart"
actor["character_name"] = "Harvey Dent"
actor["movie_id"] = series_2["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Michael Caine"
actor["character_name"] = "Alfred"
actor["movie_id"] = series_2["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Maggie Gyllenhaal"
actor["character_name"] = "Rachael Dawes"
actor["movie_id"] = series_2["id"]
actor.save

series_3 = Movie.find_by({ "title" => "The Dark Knight Rises" })
actor = Actor.new
actor["actor_name"] = "Christian Bale"
actor["character_name"] = "Bruce Wayne"
actor["movie_id"] = series_3["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Gary Oldman"
actor["character_name"] = "Commissioner Gordon"
actor["movie_id"] = series_3["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Tom Hardy"
actor["character_name"] = "Bane"
actor["movie_id"] = series_3["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Joseph Gordon-Levitt"
actor["character_name"] = "John Blake"
actor["movie_id"] = series_3["id"]
actor.save

actor = Actor.new
actor["actor_name"] = "Anne Hathaway"
actor["character_name"] = "Selina Kyle"
actor["movie_id"] = series_3["id"]
actor.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
all_movies = Movie.all
puts all_movies.inspect

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
batman1 = Actor.where({ "movie_id" => series_1["id"] })

for info in batman1
    actor = info["actor_name"]
    character = info["character_name"]
    puts "#{movie_1["title"]} #{first_name} #{last_name}"
end

batman2 = Actor.where({ "movie_id" => series_2["id"] })

for info in batman2
    actor = info["actor_name"]
    character = info["character_name"]
    puts "#{movie_2["title"]} #{first_name} #{last_name}"
end

batman3 = Actor.where({ "movie_id" => series_3["id"] })

for info in batman3
    actor = info["actor_name"]
    character = info["character_name"]
    puts "#{movie_3["title"]} #{first_name} #{last_name}"
end