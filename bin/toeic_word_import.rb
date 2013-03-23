#coding: utf-8

$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'active_record'
require 'sqlite3'
load 'app/models/word.rb'
#load 'config/database.yml'


Word.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3',
  pool: 5,
  timeout: 5000
)
IO.foreach('2000.txt') do|line|
#  p line.strip 
  @word = Word.new 
  @word.name = line.strip
  @word.japanese = "http://ejje.weblio.jp/content/" << @word.name
  @word.is_complete = false
  p @word
  @word.save
end

