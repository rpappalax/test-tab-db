# Firefox iOS Test Database Generator 

Scripts to generate oodles of test data for Firefox iOS

## Getting Started


### Prerequisites

1. sqlite3 (already installed on OSX)

2. Must have an iOS simulator Booted

```
git clone https://github.com/mozilla-mobile/firefox-ios
cd firefox-ios
git clone https://github.com/rpappalax/test-tab-db
```

## Generate data! 

```
cd test-tab-db
./generate.sh
cp *.sh ../test-fixtures
```

Copy new test databases to firefox-ios/test-fixtures

```
cp *.sh ../test-fixtures
```


