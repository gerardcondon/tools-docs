# Gitbook

* This is a `node.js` tool used for editing collections of markdown files into books.
* You write a `README.md` file which contains a description of the project.
* Also a `SUMMARY.md` file which contains the table of contents. This is written as a list of links to markdown documents. This can have one level of indentation.

## windows Installation
* [Official Setup Documentation](https://github.com/GitbookIO/gitbook/blob/master/docs/setup.md)
* [ ] First install [node.js](https://nodejs.org/en/)
* [ ] Then run `npm install gitbook-cli -g`

# Usage
* `gitbook serve` serves out a live copy of a book. Changes made to the markdown document are visible here (by refreshing??)
* `gitbook build` builds a copy of the book. This can be in a number of formats e.g. html, pdf and epub. Unfortunately there is no single page html option.
  * The epub command has a dependency on [Calibre](http://calibre-ebook.com/download) and [ebook-convert](https://www.npmjs.com/package/ebook-convert).
