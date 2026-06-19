create database Lec7_movie
go
use Lec7_movie

go 
create schema Task_tables
go 
-------Table 1 actor---------------
create table Task_tables.actor
(
act_id int PRIMARY KEY IDENTITY,
act_fname varchar(20),
act_Iname varchar(20),
act_gender char(1)
)

-------Table 2 director---------------

create table Task_tables.director
(
dir_id int PRIMARY KEY IDENTITY,
dir_fname char (20),
dir_Iname char (20)
)
execute sp_rename '[Task_tables].[director].dir_Iname','dir_Lname','colemn'

-------Table 3 reviewer---------------

create table Task_tables.reviewer
(
rev_id int PRIMARY KEY IDENTITY,
rev_name char (30)
)

-------Table 4 movie---------------

create table Task_tables.movie
(
mov_id int PRIMARY KEY IDENTITY,
mov_title char(50) ,
mov_year int ,
mov_time int, 
mov_lang char(50) ,
mov_dt_rel date,
mov_rel_country char(5) 
)

-------Table 5 genres---------------

create table Task_tables.genres
(
gen_id int PRIMARY KEY IDENTITY,
gen_title char(50)
)

-------Table 6 movie_direction---------------

create table Task_tables.movie_direction
(
dir_id INT,
mov_id INT,
PRIMARY KEY(dir_id,mov_id),

FOREIGN KEY (dir_id)
REFERENCES Task_tables.director(dir_id),

FOREIGN KEY (mov_id)
REFERENCES Task_tables.movie(mov_id)
)

-------Table 7 movie_cast---------------

create table Task_tables.movie_cast
(
act_id int,
mov_id int,
role char(30)

PRIMARY KEY(act_id,mov_id),

FOREIGN KEY (act_id)
REFERENCES Task_tables.actor(act_id),

FOREIGN KEY (mov_id)
REFERENCES Task_tables.movie(mov_id)
)

-------Table 8 movie_genres---------------

create table Task_tables.movie_genres
(
mov_id int,
gen_id int

PRIMARY KEY(mov_id,gen_id),

FOREIGN KEY (mov_id)
REFERENCES Task_tables.movie(mov_id),

FOREIGN KEY (gen_id)
REFERENCES Task_tables.genres(gen_id)
)

-------Table 9 rating---------------

create table Task_tables.rating
(
mov_id int ,
rev_id int,
rev_stars int, 
num_o_ratings int

PRIMARY KEY(mov_id,rev_id),

FOREIGN KEY (mov_id)
REFERENCES Task_tables.movie(mov_id),

FOREIGN KEY (rev_id)
REFERENCES Task_tables.reviewer(rev_id),
)