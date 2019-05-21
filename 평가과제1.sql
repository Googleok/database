-- getList(author)
select no, name from author;
select * from bookbook;

-- insert(author)
insert into author values(null, '스테파니메이어');
insert into author values(null, '조정래');

-- insert(book)
insert into book values(null, '트와일라잇', '대여가능', 1);
insert into book values(null, '뉴문', '대여가능', 1);
insert into book values(null, '이클립스', '대여가능', 1);
insert into book values(null, '브레이킹던', '대여가능', 1);

-- getList (book)
select a.title, b.name, a.status 
	from book a, author b
    where a.author_no = b.no
    order by a.no asc;

-- update (book)
update book set status='대여가능' where no = 1;
