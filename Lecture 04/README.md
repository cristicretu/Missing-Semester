Find the number of words (in /usr/share/dict/words) that contain at least three as and don’t have a 's ending.

```sh 
cat words.txt | grep -E -i '^([^a]*a){3}.*$' | grep -v -E "^\w+s$"
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

5.
Find an online data set like this one, this one, or maybe one from here.
Fetch it using curl and extract out just two columns of numerical data. If you’re fetching HTML data, pup might be helpful. For JSON data, try jq.

```sh 
curl https://ucr.fbi.gov/crime-in-the-u.s/2016/crime-in-the-u.s.-2016/topic-pages/tables/table-1 | pup "tr .group2, .group3" --color | grep -i -w -E "([0-9]{1},[0-9]{3},[0-9]{3}|[0-9]{3].[0-9]{1})}"
...
cat data.dat
```

Find the min and max of one column in a single command,

```sh 
cat data.dat | sort -k3,3 | tee >(echo "MinCrimes=$(head -n1)") \ > >(echo "Max Crimes=$(tail -n1)")
```

and the difference of the sum of each column in another.

```sh 
cat data.dat | awk '{print $1}' | tr '\n' '+' | sed 's/,//g' | sed 's/+$/\n/' | bc
```
