# require modules here
require "yaml"
require "pry"
def load_library(file_path)
 og_hash = YAML::load_file(file_path)
 formatted_hash = Hash.new{|hsh,key| hsh[key] = {}}
 og_hash.each do |key, ar|
   formatted_hash["get_meaning"].store(ar[1], key)
   formatted_hash["get_emoticon"].store(ar[0], ar[1])
 end
 formatted_hash
end
load_library("./lib/emoticons.yml")

def get_japanese_emoticon(file_path, en_emoticon)
  the_hash = load_library(file_path)
  ja_emoticon = ""
  
  the_hash.each do |key, hash_chunk|
    if key.to_s == "get_emoticon"
      
    hash_chunk.each do |k, v|
      if k.to_s == en_emoticon
      ja_emoticon = v
    end
    end
    end
  end
  if ja_emoticon.length == 0 
    "Sorry, that emoticon was not found"
  else
  ja_emoticon
end
end
get_japanese_emoticon("./lib/emoticons.yml", ":)")

def get_english_meaning(file_path, ja_emoticon)
    the_hash = load_library(file_path)
  meaning = ""
  
  the_hash.each do |key, hash_chunk|
    if key.to_s == "get_meaning"
      
    hash_chunk.each do |k, v|
      if k.to_s == ja_emoticon
      meaning = v
    end
    end
    end
  end
  if meaning.length == 0 
    "Sorry, that emoticon was not found"
  else
  meaning
end
  
  
end