desc "fetch lists from catalog and save to cache"
task :fetch_lists => :environment do

    require 'mechanize'
    require 'open-uri'
    require 'memcachier'
    require 'dalli'

    books_fic     = JSON.parse(open("http://kcl-listcacher.herokuapp.com/list/fetch.json?list_id=20862").read)
    books_nonfic  = JSON.parse(open("http://kcl-listcacher.herokuapp.com/list/fetch.json?list_id=20863").read)
    teen_books    = JSON.parse(open("http://kcl-listcacher.herokuapp.com/list/fetch.json?list_id=20866").read)
    youth_books   = JSON.parse(open("http://kcl-listcacher.herokuapp.com/list/fetch.json?list_id=20867").read)
    dvds_new      = JSON.parse(open("http://kcl-listcacher.herokuapp.com/list/fetch.json?list_id=20868").read)


    Rails.cache.write("books_fic", books_fic)
    Rails.cache.write("books_nonfic", books_nonfic)
    Rails.cache.write("teen_books", teen_books)
    Rails.cache.write("youth_books", youth_books)
    Rails.cache.write("dvds_new", dvds_new)

end
