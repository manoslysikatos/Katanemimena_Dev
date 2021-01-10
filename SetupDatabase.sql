CREATE TABLE IF NOT EXISTS `user` (
 `username` varchar(50) NOT NULL,
 `password` varchar(100) NOT NULL,
 `enabled` tinyint(1) NOT NULL,
 PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `authorities` (
 `username` varchar(50) NOT NULL,
 `authority` varchar(50) NOT NULL,
 UNIQUE KEY `ix_auth_username` (`username`,`authority`),
 CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE userInfo(
id INT NOT NULL AUTO_INCREMENT, 
first_name VARCHAR(45) DEFAULT NULL,
last_name VARCHAR(45) DEFAULT NULL,
email VARCHAR(45) DEFAULT NULL,
phone VARCHAR(20) DEFAULT NULL, 
status INT,
department INT NOT NULL, 
userInfo_id int UNIQUE DEFAULT NULL,
role VARCHAR(20) DEFAULT NULL,
PRIMARY KEY (id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE candidate(
id INT NOT NULL AUTO_INCREMENT,
supervisor INT NOT NULL,
task_points INT NOT NULL, 
PRIMARY KEY (id),
FOREIGN KEY (id) REFERENCES userInfo(userInfo_id) ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (supervisor) REFERENCES userInfo(id) ON DELETE NO ACTION ON UPDATE NO ACTION
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE task(
id int NOT NULL AUTO_INCREMENT,
type int NOT NULL,
description VARCHAR(200),
supervisor_id int NOT NULL,
board_member_id int,
points int(4),
status int(1),
PRIMARY KEY (id),
FOREIGN KEY (supervisor_id) REFERENCES userInfo(id),
FOREIGN KEY (board_member_id) REFERENCES userInfo(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE task_per_candidate(
task_id int not null,
candidate_id int not null,
completed int not null,
foreign key (task_id) references task(id),
foreign key (candidate_id) references userInfo(id)
);

/*PASSWORD: pass123*/
INSERT INTO `user` (`username`, `password`, `enabled`) VALUES
   ('argiris', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1),
   ('root', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1);



INSERT INTO `authorities` (`username`, `authority`) VALUES
   ('root', 'ROLE_ADMIN'),
   ('argiris', 'ROLE_SUPER');

INSERT INTO `userInfo` VALUES
      (1,'Argiris','Tsadimas','it@hua.gr','+306956345634',1,1,null,'ROLE_SUPER'),
      (2,'John','Doe','it@hua.gr','+306956345634',1,1,1,'ROLE_CAN'),
      (3,'Emmanouil','Lysikatos','it@hua.gr','+306956345634',1,1,2,'ROLE_CAN'),
      (4,'Liza','Riga','it@hua.gr','+306956345634',1,1,null,'ROLE_ADMIN'),
      (5,'Olga','Sofianidi','it@hua.gr','+306956345634',1,1,null,'ROLE_BOARD');

INSERT INTO `candidate` VALUES
      (1, 1, 15),
      (2, 1, 35);

INSERT INTO `task` VALUES
      (1,1,'Until 22/1/2021',1,5,5,1),
      (2,2,'Until 31/1/2021',1,5,5,2),
      (3,3,'Until 10/2/2021',1,5,5,1);
