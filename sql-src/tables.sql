CREATE TABLE queues (
    id serial not null unique,
    queue_name primary key,
    language text not null,
    classname text not null
);

CREATE TABLE jobtemplate (
    id bigserial primary key, -- yes people run out of ints
    queueid int not null references queues(id),
    coalesce_code text not null default '',
    lock_id int not null default 0, -- but defaults means one job at a time!
    args jsonb not null,
    run_after timestamp,
    priority double precision not null,
    check noinhrit (false) -- never insert anything into this table
);