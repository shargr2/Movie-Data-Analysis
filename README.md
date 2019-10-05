# The-Magic-Table-Goes-To-The-Movies
Project 2 Final repo
 The Magic Table goes to the movies!

Team Members:
Ann, David, Shaena, Tomás
Goal
In this project we will construct a data set with all movies released through the 2015 (88th) Academy Awards, This dataset will have three major tables: 
List of movies, budget, production company, release date, revenue.
Oscars Nominees and Winners: a table with all nominees and winners (for the best movie category) from 1927 through the 2015 (88th) Academy Awards.
Reviews: a table with  26 million ratings from 270,000 users 

This dataset will allow the user to explore the relationships between, budget, revenue, awards, and the average rating. 

Since most of our raw data is in CSV form, we will use pandas to import, summarise, selection of specific columns, filter, join and aggregate data. We will then create a master data frame that we will then export to an SQL database. 

 
Data Sources
Data sets:
Movies data set (movies_metada.csv): all 45,000 movies listed in the Full MovieLens Dataset. The dataset consists of movies released on or before July 2017. Data points include cast, crew, plot keywords, budget, revenue, posters, release dates, languages, production companies, countries, TMDB vote counts and vote averages.
Oscar nominees/winners (oscar.csv): The Academy Awards Database contains the official record of past Academy Award winners and nominees. The data is complete through the 2015 (88th) Academy Awards, presented on February 28, 2016.
Ratings (ratings.csv)

Report
Extract
For this project, we leverage data available at Kaggle. Specifically, we accessed data related to: 
Oscar winners and nominees 
Movies and their ratings (by user)
Movies and their budget, revenue, production companies, title and release dates

All files had a comma-separated values (csv) format. After we found and saved the original datasets we proceed to transform the data sets.

Transform
Oscar Winners and Nominees
We implemented the following steps

We only considered movies that were nominated (and winners) for Best Movie and Best Motion Picture.
We selected and rename the following variables (the new names are in parenthesis)
Year (release year)
Name (title)
Film (production_companies)
Winner (win)
In order to link the different tables together, we needed to create an id variable (‘imdb_id’). To accomplish this we:
We used a lambda function to strip blank spaces from the ‘tittle” variable.
From the movies_metadata.csv we selected the variables ‘title’ and ‘imdb_id’. 
We merged these two datasets on “title’. 
We removed duplicates if present 

Ratings
To construct the dataset with ratings for each movie (notice that the same movie may have multiple reviewers)
We selected 3 variables
movieId
rating
userId (reviewer_id)
In order to add the “imdb_id” variable, we leveraged a fourth dataset (links.csv) that had ‘movieId’ and ‘imdb_id’. We merged these datasets on ‘movieId’. 
We removed duplicates if present

All movies
To construct this table we imported the ‘movies_metadata.csv’ table. 
From this table we selected the 'budget', 'imdb_id', 'title', 'release_date', 'revenue',  'production_companies' variables.
The ‘production_companies’ variable was stored as a list of dictionaries. For each movie, we extracted the information related to the production companies, notice that some movies have more than one production company. To do this, we used pandas’ “.str.replace()” function to delete all unwanted characters.
We dropped duplicated rows.
We only kept complete cases. 
 
Load

To Load the data, we first created a DataBase in MySQL called “Magic_Table_db”. We then populated the database with three blank tables: “all_movies”, “best_movies” and “ratings”. To do this we ran the schemas entitle “The Magic Table goes to the movies schemas.sql” in the PGadmin query tool. We used “imdb_id” as a common thread (primary/foreign key) between tables; so that users of the database can join unique values from one table to another. 

Then in our jupyter notebook, we connected to the local database (“Magic_Table_db”) using the “create_engine” function and verified that the empty tables were successfully created. We then use pandas to load the CSV converted DataFrames into the database using the “.to_sql” function. We then verified that the loading was successful using the “read_sql_query” function. 


Now our extracted and transformed data can be read using SQLalchemy speech in python and also viewed in PGadmin/ MYSQL for further analysis!


