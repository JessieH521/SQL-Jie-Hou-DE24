create table if not exists hemnet_data as (
    select * from read_csv_auto('data/hemnet_data_clean.csv')
);






