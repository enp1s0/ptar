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

## How to use
```bash
./bin/ptar [num_procs] [num_procs_per_node] [src_dir] [dst_path.tar]

# e.g. 4 nodes 32 procs
./bin/ptar 32 8 /nfs/shared/dataset/poi/ $HOME/poi.tar
```

## Requirements

- tar
- Open MPI

## LICENSE
MIT
