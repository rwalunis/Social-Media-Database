
CREATE TABLE 'socialmediadb'.'users' ( 
  `user_id` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` char(2) NOT NULL,
  `country` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  PRIMARY KEY (`user_id`));

CREATE TABLE 'socialmediadb`.'posts` (
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` varchar(150) NOT NULL,
  `post_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`post_id`),
  INDEX 'user_id_idx' ('user_id' ASC) VISIBLE,
  CONSTRAINT 'user_id'
   FOREIGN KEY ('user_id')
   REFERENCES 'socialmediadb'.'users' ('user_id')
   ON DELETE NO ACTION
   ON DELETE NO ACTION);

CREATE TABLE 'socialmediadb'.`comments` (
  `comment_id` int NOT NULL,
  `post_id` int NOT NULL,
  `users_id` int NOT NULL,
  `description` varchar(150) NOT NULL,
  `comment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  INDEX `post_id_idx` (`post_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `post_id` 
   FOREIGN KEY (`post_id`) 
   REFERENCES `socialmediadb'.'posts` (`post_id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
  CONSTRAINT `users_id` 
   FOREIGN KEY (`users_id`) 
   REFERENCES `socialmediadb'.'users` (`user_id`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);