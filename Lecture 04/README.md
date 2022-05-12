Find the number of words (in /usr/share/dict/words) that contain at least three as and don’t have a 's ending.

```sh 
cat words.txt | grep -E '^([^a]*a){3}.*$' | grep -v -E "^\w+s$"
```


What are the three most common last two letters of those words? sed’s y command, or the tr program, may help you with case insensitivity.

```sh 
cat words.txt | grep -E '^([^a]*a){3}.*$' | grep -v -E "^\w+s$" | sed -E "s/.*([a-z]{2})$/\1/" | sort | uniq -c | sort -k1,1 | tail -n3
```


How many of those two-letter combinations are there?

```sh 
cat words.txt | grep -E '^([^a]*a){3}.*$' | grep -v -E "^\w+s$" | sed -E "s/.*([a-z]{2})$/\1/" | sort | uniq -c | wc -l
```

And for a challenge: which combinations do not occur?
