create table if not exists cleaned_salaries as(
    select * from read_csv_auto('data/salaries.csv')
);













