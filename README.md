# .emacs.d
My personal emacs config repository

# Email

I use offlineimap with mu4e to manage my gmail emails in Emacs.  
To this I installed offlinemap, + mu4e.

Mu4e config el included here.

Offline imap is a bit slow to download my emails.

Offlineimap sample settings file included [here](./.offlineimaprc-sample)

Todo
- [ ] Find another way to download and sync my imap emails.  
Here we have another suggestion what to use instead of offlineimap  
https://www.reddit.com/r/emacs/comments/8q84dl/tip_how_to_easily_manage_your_emails_with_mu4e/

# Org mode

I installed org-mode. Org.el included here with my current config.

# Calendar

I have a custom config to provide week numbers in calendar view. Config included in calendar.el.

# Ruler

If you need a ruler e.g. markdown editing, use ruler-mode.

# Bookmarks

To add a page to the bookmarks set C+X, r, m, I guess (m:mark)

To list bookmarks: C+X, r, l

Pretty usefull :)

# Org mode table

For table editing just enter org-mode, and starts to write a table  
|header A|header B|header C| and C-c RET

Then the magic

| header A | header B | header C |
|----------+----------+----------|
| .        | ..       | ...      |
| .        | ..       | ...      |
| .        | ..       | ...      |

Voilá!

# TODO

| Todo  | Description                                    |
|-------+------------------------------------------------|
| - [ ] | Applying hunspell, or some other spell checker |
| - [ ] | mu4e config, its annoying a bit right now      |
| - [ ] | git server setup                               |
| - [ ] | family domain name                             |
| - [ ] | family mail server                             |

# GIT merge conflict

Once we have a conflict, then enter the file, take the cursor inside the required version, then  
M-x smerge-keep-current => this will select the current selected version and remove the others.  
Conflict solved.

# GIT credential store

```bash
git config credential.helper store
```

# Export md to ..

``` bash
pandoc file.md -o file.epub
pandoc file.md -o file.html
pandoc file.md -o file.rtf
pandoc file.md -o file.odt
...
```

# Markdown pandoc md to html what's about links?

What happen when we use internal links to .md files, but we want to use them after  
compile to html?

This article contains the solution:

[SOLUTION](https://stackoverflow.com/questions/40993488/convert-markdown-links-to-html-with-pandoc)
