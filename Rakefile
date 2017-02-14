BOOK_NOTES_FOLDER="../book-notes"

def rebuild_gitbook(book_name)
    `rm -rf #{BOOK_NOTES_FOLDER}/#{book_name}/_book`
    `cd #{BOOK_NOTES_FOLDER}/#{book_name} && gitbook build`
    `rm -rf docs`
    `mkdir docs`
    `cp -r #{BOOK_NOTES_FOLDER}/#{book_name}/_book/* docs`
end

desc "Rebuild the website"
task :rebuild do
    rebuild_gitbook("tools")
end

desc "Serve the website"
task :serve do
    `ruby -run -e httpd docs -p $PORT`
end

desc "Push to Github Pages"
task :deploy do
    `git add docs`
    `git commit -m "Updating website"`
    `git push`
end