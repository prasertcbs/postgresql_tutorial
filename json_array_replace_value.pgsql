-- สอน PostgreSQL: การแก้ไขค่าใน JSON array
-- doc: https://www.postgresql.org/docs/12/functions-json.html
-- YouTube: https://youtu.be/cJC0EsYOrcs
-- Author: Prasert Kanawattanachai
-- email: prasert.k@chula.ac.th

drop table if exists person;

CREATE TABLE person (
    id int,
    info jsonb
);

INSERT INTO person VALUES (1, '{"age": 32, "gender": "M", "height": 1.78, "skills": {"computers": ["Word", "PowerPoint", "Excel"], "languages": [{"lang": "Korean", "level": 3}, {"lang": "Japanese", "level": 4}]}, "weight": 70, "address": {"city": "London", "postalCode": "630-0192", "streetAddress": "naist street"}, "hobbies": ["running", "swimming", "biking"], "lastName": "Bond", "firstName": "James", "phoneNumbers": [{"type": "work", "number": "07-007-8888"}, {"type": "home", "number": "0123-4567-8910"}]}');
INSERT INTO person VALUES (2, '{"age": 31, "gender": "F", "height": 1.6, "skills": {"computers": ["Photoshop", "Linux", "Excel", "PostgreSQL"], "languages": [{"lang": "English", "level": 3}, {"lang": "Chinese", "level": 4}, {"lang": "Korean", "level": 2}, {"lang": "French", "level": 1}]}, "weight": 48, "address": {"city": "New York", "postalCode": "630-0192", "streetAddress": "1st street"}, "hobbies": ["knitting", "swimming", "reading"], "lastName": "Foster", "firstName": "Jane", "phoneNumbers": [{"type": "mobile", "number": "089-123-4567"}, {"type": "home", "number": "02-567-3399"}, {"type": "work", "number": "02-432-4455"}]}');
INSERT INTO person VALUES (3, '{"age": 18, "gender": "M", "height": 1.65, "skills": {"computers": ["Python", "C"], "languages": [{"lang": "English", "level": 3}, {"lang": "Chinese", "level": 4}]}, "weight": 60, "address": {"city": "New York", "postalCode": "567-1122", "streetAddress": "5th Avenue"}, "hobbies": ["cooking", "swimming"], "lastName": "Parker", "firstName": "Peter", "phoneNumbers": [{"type": "mobile", "number": "055-111-5599"}, {"type": "home", "number": "02-111-2233"}]}');

select * from person;

select info->>'firstName', info->'hobbies' from person;

-- replace value in JSON array
select jsonb_set('["knitting", "swimming", "reading", "running"]', '{3}', '"JOGGING"');

-- replace (remove unwanted -> append new one) array element ('running' to 'jogging')
-- ex 1.
select info->'hobbies', 
    (info->'hobbies') - 'running',
    (info->'hobbies') - 'running' || '"jogging"' 
    from person
    where info->'hobbies' ? 'running';

select info->'hobbies',
    jsonb_set(info, '{hobbies}', (info->'hobbies') - 'running' || '"jogging"')
    from person
    where info->'hobbies' ? 'running';

update person
    set info=jsonb_set(info, '{hobbies}', (info->'hobbies') - 'running' || '"jogging"')
    where info->'hobbies' ? 'running';

select info->>'firstName', info->'hobbies' from person;

-- ex 2.
select info->>'firstName', info->'skills'->'computers' from person;

select info->'skills'->'computers', 
    (info->'skills'->'computers') - 'C' || '"C++"'
    from person
    where (info->'skills'->'computers') ? 'C';

update person
    set info=jsonb_set(info, '{skills,computers}', (info->'skills'->'computers') - 'C' || '"C++"')
    where (info->'skills'->'computers') ? 'C';

select info->>'firstName', info->'skills'->'computers' from person;

select * from person;