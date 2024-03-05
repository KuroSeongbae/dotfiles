monerod --data-dir=/mnt/secondDrive/Crypto/Monero --zmq-pub tcp://127.0.0.1:18083 --out-peers 32 --in-peers 64 --add-priority-node=p2pmd.xmrvsbeast.com:18080 --add-priority-node=nodes.hashvault.pro:18080 --disable-dns-checkpoints --enable-dns-blocklist --detach

p2pool --mini --host 127.0.0.1 --wallet 4AU2xRyFNY54SagXj2nzP4dXcPsV1uLu8SrqEFkKfgkwHv55pXfUCHk4uS5cGSgNp38x8es6QjD6FBVnNFNihTEWVAXX9Rm &> /dev/null &

sudo xmrig -o 127.0.0.1:3333
