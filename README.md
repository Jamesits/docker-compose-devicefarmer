Here is a minimal configuration for starting a [DeviceFarmer](https://github.com/DeviceFarmer/stf) (previously known as OpenSTF) server in a microservice (non-"local") deployment. The services are still brought up in a single server, but the method can be easily extended to a cluster.

Software requirements:
- Linux
- Docker
- docker-compose

Hardware requirements:
- 1 core
- 1.5GiB free memory
- 2GiB free disk space

Basic usage:

1. Edit `.env`, replace `100.97.3.116` with your own server hostname or IP
1. Replace the hardcoded session key in `stf-session.env` to a random value
1. If HTTPS is required, edit `nginx.conf` and enable HTTPS server config
1. Run `./up.sh` (you might need root to make permissions right)

Backup:

Backup the `deployment` directory.
