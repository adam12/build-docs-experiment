#!/usr/bin/env ruby

require "bundler/inline"

gemfile do
  source "https://rubygems.org"

  gem "sqlite3"
  gem "sequel"
  gem "pry"
end

DB = Sequel.sqlite

DB.create_table("results") do
  String :name, null: false
  String :version, null: false
  Integer :size, null: false
  Integer :duration, null: false
end

File.open("build-log", "r").each_line do |line|
  next unless line.start_with?("Result")

  line.sub!("Result: ", "")
  data = line.split(" ").map { _1.split("=") }.to_h
  DB[:results].insert(data)
end

binding.pry
