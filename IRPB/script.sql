--MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM
-- EVANDRO DEMUTH
-- 09/01/2015
-- CREATE IPRB MUSIC TABLES v1.0
--MWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWMWM

create table if not exists artist
(
  id int not null auto_increment,
  name varchar(150) not null,
  primary key (id)
);

create table if not exists album
(
  id int not null auto_increment,
  name varchar(150) not null,
  published_date date,
  id_artist int,
  foreign key (id_artist) references artist(id),
  primary key (id)
);

create table if not exists song
(
  id int not null auto_increment,
  title varchar(150) not null,
  id_artist int not null,
  id_album int,
  lyric text not null,
  primary key (id),
  constraint chk_unique_song UNIQUE (title, id_artist)
);

create table if not exists tag
(
    id int not null auto_increment,
    description varchar(50) not null,
    id_song int not null,
    primary key (id),
    foreign key (id_song) references song(id),
    constraint chk_unique_tag UNIQUE (description, id_song)
);
