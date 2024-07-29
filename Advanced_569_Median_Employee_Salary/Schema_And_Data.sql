-- leetcode."Employee" definition

-- Drop table

-- DROP TABLE leetcode."Employee";

CREATE TABLE leetcode."Employee" (
	id int4 NOT NULL,
	company varchar NULL,
	salary int4 NULL
);

INSERT INTO postgres.leetcode."Employee" VALUES(1,'A',2341);
INSERT INTO postgres.leetcode."Employee" VALUES(2,'A',341);
INSERT INTO postgres.leetcode."Employee" VALUES(3,'A',15);
INSERT INTO postgres.leetcode."Employee" VALUES(4,'A',15314);
INSERT INTO postgres.leetcode."Employee" VALUES(5,'A',451);
INSERT INTO postgres.leetcode."Employee" VALUES(6,'A',513);
INSERT INTO postgres.leetcode."Employee" VALUES(7,'B',15);
INSERT INTO postgres.leetcode."Employee" VALUES(8,'B',13);
INSERT INTO postgres.leetcode."Employee" VALUES(9,'B',1154);
INSERT INTO postgres.leetcode."Employee" VALUES(10,'B',1345);
INSERT INTO postgres.leetcode."Employee" VALUES(11,'B',1221);
INSERT INTO postgres.leetcode."Employee" VALUES(12,'B',234);
INSERT INTO postgres.leetcode."Employee" VALUES(13,'C',2345);
INSERT INTO postgres.leetcode."Employee" VALUES(14,'C',2645);
INSERT INTO postgres.leetcode."Employee" VALUES(15,'C',2645);
INSERT INTO postgres.leetcode."Employee" VALUES(16,'C',2652);
INSERT INTO postgres.leetcode."Employee" VALUES(17,'C',65);
