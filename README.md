# Timecard

Simple time tracking app for automated testing workshop

## Requirements

* Ruby 1.9.2 - 1.9.3

## Getting started

Clone the repository

    $ git clone git://github.com/therubyworkshop/timecard.git

Or [download](https://github.com/therubyworkshop/timecard/archive/master.zip) and unzip the repository

After cloning/downloading the repository run

    $ cd timestamp
    $ ./script/newb

This will install the appropriate gems, set up your DB and add some dummy data.

## Testing

### All tests

    $ rake

### Unit tests

    $ rake test:units
    $ rake test:functionals

### Integration tests

    $ rake test:integration

## Running the app

    $ rails server

Surf to http://localhost:3000
