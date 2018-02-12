#/bin/bash
cd "$(dirname "$0")"
docker exec -i client sh < ../scripts/reset.sh
docker exec -i server sh < ../scripts/reset.sh
docker exec -i router sh < ../scripts/reset.sh
