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

| Todo  | Description |
|-------+-------------|
| - [ ] | Applying    |
