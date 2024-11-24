create schema if not exists staging;

create table if not exists staging.sql_glossary as (
    select * from read_csv_auto('data/sql_terms.csv')
);

















