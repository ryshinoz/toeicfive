#coding: utf-8

$:.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'active_record'
require 'sqlite3'
load 'app/models/word.rb'

Word.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3',
  pool: 5,
  timeout: 5000
)
Word.destroy_all

IO.foreach('2000.txt') do|line|
#  p line.strip 
  @word = Word.new 
  @word.name = line.strip
  @word.dictionary_url = "http://www.ldoceonline.com/dictionary/" << @word.name
  @word.is_complete = false
  p @word
  @word.save
end

