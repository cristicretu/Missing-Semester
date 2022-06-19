## Debugging

`
log show --last 1d | grep sudo
`

## Profiling

```
time python3 sorts.py 
python3 -m cProfile sorts.py 
python3 -m memory_profile sorts.py
```
