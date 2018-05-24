drop table if exists users;

create table users (
	id smallserial primary key,
	name text not null,
	username text not null,
	alias text,
	email text,
	github text,
	super smallint,
	bio text default '这个基友很强，居然没写介绍 QAQ',
	dev_bio text,
	ctime timestamp not null default now(),
	atime timestamp not null default now(),
	avatar text default '',
	following smallint default 0,
	followed smallint default 0
);

drop table if exists follow;

create table follow (
	userid smallint not null,
	followed smallint not null
);

drop table if exists hash;

create table hash (
	userid smallint not null primary key,
	hash text not null
);

drop table if exists apps;

create table apps(
	id smallserial primary key,
	creator smallint not null,
	category smallint,
	name text not null,
	alias text default '',
	pkgname text default '<unnamed>',
	icon text,
	version text default '<unversionized>',
	reversion smallint not null,
	description text default '(assert-not description-provided)',
	updates text,
	visualizer text,
	optlabel text,
	special text,
	install text,
	previews text,
	apimin smallint,
	apitarget smallint,
	size int default 0,
	lang text,
	src text,
	perm text,
	stars smallint default 0,
	replies int default 0,
	locked boolean default false,
	updated timestamp
);

drop table if exists updates;

create table updates(
	app smallint not null,
	name text not null,
	alias text not null,
	icon text,
	version text default '<unversionized>',
	reversion smallint not null,
	description text default '',
	updates text,
	visualizer text,
	optlabel text,
	special text,
	install text,
	previews text,
	apimin smallint,
	apitarget smallint,
	size int default 0,
	perm text
);

drop table if exists star;

create table star(
	userid smallint not null,
	app smallint not null
);

drop table if exists categories;

create table categories (
	id smallserial primary key,
	name text not null,
	parent text
);

drop table if exists recommend;

create table recommend(
	userid smallint not null,
	app smallint not null,
	recommend int not null
);

drop table if exists top;

create table top(
	app smallint not null,
	pinned int not null
);

drop table if exists comments;

create table comments(
	id serial primary key,
	userid smallint not null,
	target smallint not null,
	ctime timestamp not null default now(),
	mtime timestamp not null,
	reply int,
	content text not null,
	stars smallint default 0,
	likes smallint default 0,
	replies int default 0
);

drop table if exists comment_star;

create table comment_star(
	userid smallint not null,
	comment int not null
);

drop table if exists like_comment;

create table like_comment(
	userid smallint not null,
	comment int not null
);

drop table if exists postage;

create table postage(
	to_userid smallint not null,
	sender smallint not null,
	typed smallint default 0,
	data int default 0,
	ignore boolean default false,
	ctime timestamp not null default now()
);

drop table if exists privtable;

create table privtable (
	userid smallint not null,
	id serial primary key,
	ttype smallint default 0,
	accessable smallint,
	message text not null,
	ctime timestamp not null default now(),
	mtime timestamp not null
);

drop table if exists timeline;

create table timeline(
	userid smallint not null,
	ctime timestamp not null default now(),
	ttype smallint not null default 0,
	data integer not null
);

drop table if exists presis_tokens;

create table presis_tokens(
	userid smallint not null,
	token text not null,
	ctime timestamp not null,
	access_level smallint not null default 0
);
