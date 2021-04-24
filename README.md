# Chia plotter docker image
A simple and scalable docker image for creating Chia plots.

## Configuration
Required configuration:
* Setting the farmer public key (`FARMERKEY`) via environment (e.g. `-e FARMERKEY=123456deadbeef0453278738[...]`)
* Setting the pool public key (`POOLKEY`) via environment (e.g. `-e POOLKEY=654321beefdead523453464566[...]`)
* Bind mounting a host temp dir in the container to `/chia/temp` (e.g. `-v /path/to/fast/temp/storage/:/chia/temp`)
* Bind mounting a host plot dir in the container to `/chia/plots`  (e.g. `-v /path/to/plot/destination/storage/:/chia/plots`)

Optional environment variables:
* `MEMSIZE`: (int) Memory buffer size
* `THREADS`: (int) Number of threads
* `BUCKETS`: (int) Number of buckets

Also have a look at [the Chia CLI plots documentation](https://github.com/Chia-Network/chia-blockchain/wiki/CLI-Commands-Reference#plots) for more info on what each setting does.
