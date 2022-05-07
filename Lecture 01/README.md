Exercises

All classes in this course are accompanied by a series of exercises. Some give you a specific task to do, while others are open-ended, like “try using X and Y programs”. We highly encourage you to try them out.

We have not written solutions for the exercises. If you are stuck on anything in particular, feel free to send us an email describing what you’ve tried so far, and we will try to help you out.

For this course, you need to be using a Unix shell like Bash or ZSH. If you are on Linux or macOS, you don’t have to do anything special. If you are on Windows, you need to make sure you are not running cmd.exe or PowerShell; you can use Windows Subsystem for Linux or a Linux virtual machine to use Unix-style command-line tools. To make sure you’re running an appropriate shell, you can try the command echo $SHELL. If it says something like /bin/bash or /usr/bin/zsh, that means you’re running the right program.
Create a new directory called missing under /tmp.
Look up the touch program. The man program is your friend.
Use touch to create a new file called semester in missing.
Write the following into that file, one line at a time:
#!/bin/sh
curl --head --silent https://missing.csail.mit.edu
The first line might be tricky to get working. It’s helpful to know that # starts a comment in Bash, and ! has a special meaning even within double-quoted (") strings. Bash treats single-quoted strings (') differently: they will do the trick in this case. See the Bash quoting manual page for more information.

Try to execute the file, i.e. type the path to the script (./semester) into your shell and press enter. Understand why it doesn’t work by consulting the output of ls (hint: look at the permission bits of the file).
Run the command by explicitly starting the sh interpreter, and giving it the file semester as the first argument, i.e. sh semester. Why does this work, while ./semester didn’t?
Look up the chmod program (e.g. use man chmod).
Use chmod to make it possible to run the command ./semester rather than having to type sh semester. How does your shell know that the file is supposed to be interpreted using sh? See this page on the shebang line for more information.
Use | and > to write the “last modified” date output by semester into a file called last-modified.txt in your home directory.
Write a command that reads out your laptop battery’s power level or your desktop machine’s CPU temperature from /sys. Note: if you’re a macOS user, your OS doesn’t have sysfs, so you can skip this exercise.

<hr>

touch semester

vi semester

./semester
zsh: permission denied: ./semester
ls -l
total 8
-rw-r--r--  1 cristicretu  wheel  61 May  7 10:08 semester
sh semester
HTTP/2 200
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Fri, 04 Mar 2022 17:03:44 GMT
access-control-allow-origin: *
etag: "62224670-1f37"
expires: Sat, 07 May 2022 07:19:38 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: E3CE:2E31:610E0C:642FBD:62761B32
accept-ranges: bytes
date: Sat, 07 May 2022 07:09:38 GMT
via: 1.1 varnish
age: 0
x-served-by: cache-vie6334-VIE
x-cache: MISS
x-cache-hits: 0
x-timer: S1651907378.353366,VS0,VE96
vary: Accept-Encoding
x-fastly-request-id: 49f824e306beb7af6d68526bfa087751e96c9982
content-length: 7991

vi semester

man chmod

chmod +x semester

./semester
HTTP/2 200
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Fri, 04 Mar 2022 17:03:44 GMT
access-control-allow-origin: *
etag: "62224670-1f37"
expires: Sat, 07 May 2022 07:19:38 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: E3CE:2E31:610E0C:642FBD:62761B32
accept-ranges: bytes
date: Sat, 07 May 2022 07:14:37 GMT
via: 1.1 varnish
age: 299
x-served-by: cache-vie6368-VIE
x-cache: HIT
x-cache-hits: 1
x-timer: S1651907677.091440,VS0,VE0
vary: Accept-Encoding
x-fastly-request-id: 75171701ed1ec6f8046c3e1af0d2357a64ec8cb0
content-length: 7991

./semester | grep -i "last-modified"
last-modified: Fri, 04 Mar 2022 17:03:44 GMT
./semester | grep -i "last-modified" > ~/fun/Missing\ Semester/Lecture\ 01/last-modified.txt
