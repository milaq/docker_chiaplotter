![](https://www.chia.net/img/chia_logo.svg)

# Chia plotter docker image
A simple and scalable docker image for creating Chia plots.

## Configuration
Required configuration:
* Setting the farmer public key (`FARMERKEY`) via environment (e.g. `-e FARMERKEY=0815deadbeef42...`)
* Setting the pool public key (`POOLKEY`) via environment (e.g. `-e POOLKEY=1337beef42069...`)
* Bind mounting a host temp dir in the container to `/chia/temp` (e.g. `-v /path/to/fast/storage/:/chia/temp`)
* Bind mounting a host plot dir in the container to `/chia/plots`  (e.g. `-v /path/to/storage/:/chia/plots`)

Optional environment variables:
* `COUNT`: (int) Number of subsequential plots to generate
* `MEMSIZE`: (int) Memory buffer size
* `THREADS`: (int) Number of threads
* `BUCKETS`: (int) Number of buckets

Also have a look at [the Chia CLI plots documentation](https://github.com/Chia-Network/chia-blockchain/wiki/CLI-Commands-Reference#plots) for more info on what each setting does.

## Example
Running a plotter with the default options and a memsize of 6GB:
```
docker run -d --restart=always --log-opt max-size=50M --name chiaplotter12 -e FARMERKEY=0815deadbeef42 -e POOLKEY=1337beef42069 -e MEMSIZE=6144 -v /cache/disk12/:/chia/temp -v /mnt/chia/plots/:/chia/plots chiaplotter
```
