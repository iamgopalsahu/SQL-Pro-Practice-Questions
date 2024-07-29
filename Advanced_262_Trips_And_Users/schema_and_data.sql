-- leetcode."Trips" definition

-- Drop table

-- DROP TABLE leetcode."Trips";

CREATE TABLE leetcode."Trips" (
	id int4 NOT NULL,
	client_id int4 NOT NULL,
	driver_id int4 NOT NULL,
	city_id int4 NOT NULL,
	status varchar NOT NULL,
	request_at date NOT NULL,
	CONSTRAINT newtable_pk PRIMARY KEY (id)
);

-- leetcode.users definition

-- Drop table

-- DROP TABLE leetcode.users;

CREATE TABLE leetcode.users (
	users_id int4 NOT NULL,
	banned varchar NOT NULL,
	"role" varchar NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (users_id)
);

-- leetcode."Trips" Data Insert

INSERT INTO postgres.leetcode."Trips" VALUES(1,1,10,1,'completed','2013-10-01');
INSERT INTO postgres.leetcode."Trips" VALUES(2,2,11,1,'cancelled_by_driver','2013-10-01');
INSERT INTO postgres.leetcode."Trips" VALUES(3,3,12,6,'completed','2013-10-01');
INSERT INTO postgres.leetcode."Trips" VALUES(4,4,13,6,'cancelled_by_client','2013-10-01');
INSERT INTO postgres.leetcode."Trips" VALUES(5,1,10,1,'completed','2013-10-02');
INSERT INTO postgres.leetcode."Trips" VALUES(6,2,11,6,'completed','2013-10-02');
INSERT INTO postgres.leetcode."Trips" VALUES(7,3,12,6,'completed','2013-10-02');
INSERT INTO postgres.leetcode."Trips" VALUES(8,2,12,12,'completed','2013-10-03');
INSERT INTO postgres.leetcode."Trips" VALUES(9,3,10,12,'completed','2013-10-03');
INSERT INTO postgres.leetcode."Trips" VALUES(10,4,13,12,'cancelled_by_driver','2013-10-03');

-- leetcode."Users" definition Data Insert

INSERT INTO postgres.leetcode."Users" VALUES(1,'No','client');
INSERT INTO postgres.leetcode."Users" VALUES(2,'Yes','client');
INSERT INTO postgres.leetcode."Users" VALUES(3,'No','client');
INSERT INTO postgres.leetcode."Users" VALUES(4,'No','client');
INSERT INTO postgres.leetcode."Users" VALUES(10,'No','driver');
INSERT INTO postgres.leetcode."Users" VALUES(11,'No','driver');
INSERT INTO postgres.leetcode."Users" VALUES(12,'No','driver');
INSERT INTO postgres.leetcode."Users" VALUES(13,'No','driver');
