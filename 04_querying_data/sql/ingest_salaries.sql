create table if not exists data_jobs as (
    select * from read_csv_auto('data/salaries.csv')
);





















