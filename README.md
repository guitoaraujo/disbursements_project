# README

## Setup

* install `Ruby 3.0.1`
* install `Rails 7.0.6`
* install `MySQL`

## Project

* run `bundle install`
* run `rails server`
* create merchants: post `http://localhost:3000/merchants`
* create orders: post `http://localhost:3000/merchants/:merchant_id/orders`
* create disbursements: `rails console` then `CreateDisbursementJob.new.perform`

## TODO

* Install postgresql
* Install RSpec and develop test cases
* Install Sidekiq to handle cron job as expected
* Create a class to generate data per year as expected
* Refactor code, specially disbursement job to avoid loops inside loops 

## Decisions

* First of all, I really found hard to finish everything in time, so I did what I could.
* I first spent some time reading the challenge description and after one hour or so I started.
* Disbursements logics are complex at first sight, I probably left something uncovered.
* My import_data methods did not worked as I expected due to files sizes.
