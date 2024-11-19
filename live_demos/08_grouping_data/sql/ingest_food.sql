create table 
    if not exists food as(
    select
        *
    from 
        read_csv_auto('data/food_search_google.csv')
)