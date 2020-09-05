# Firefox iOS Test Database Generator 

Scripts to generate oodles of test data for Firefox iOS


## Prerequisites

1. sqlite3 (already installed on OSX)

2. Must have an iOS simulator Booted

```
git clone https://github.com/mozilla-mobile/firefox-ios
cd firefox-ios
git clone https://github.com/rpappalax/test-tab-db
```

## Generate data 

```
cd test-tab-db
./generate.sh
cp *.sh ../test-fixtures
```

Copy new test databases to firefox-ios/test-fixtures

```
cp *.sh ../test-fixtures
```


## View data 

open database

```
sqlite3 <database_name>.db
```

show tables

```
.tables
```

show record count / records for tabs table

``` 
select count(*) from tabs;
select * from tabs;
```

exit

```
.exit
```

