# ptar - parallel tar

A parallel tar archiver

```
                         /------- tar list.0 ---------\
                        /-------- tar list.1 ----------\
                       /--------- tar list.2 -----------\
Gen whole list ->      +--------- tar list.3 -----------+ -> Conratenate (dst.tar)
                       \--------- tar list.4 -----------/
                        \-------- tar list.5 ----------/
                         \------- tar list.6 ---------/
                    |================ MPI ================|
```

## Requirements

- tar
- Open MPI

## LICENSE
MIT
