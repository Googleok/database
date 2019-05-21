insert 
	into guestbook
values(null, '둘리', '1234', '호잇~', now());

insert 
	into guestbook
values(null, '마이콜', '1234', '라면은~~~', now());

SELECT 
    no,
    name,
    contents,
    DATE_FORMAT(reg_date, '%Y-%m-%d %h:%i:%s')
FROM
    guestbook
ORDER BY reg_date DESC;