# ciscovpn

使用思科 vpn 和 3proxy 自用科学上网解决方案。

```
  git clone https://github.com/tingyanshen/ciscovpn ciscovpn
  sed -i 's/<URL>/<YOUR_URL>/g' ciscovpn/openconnect/.env
  sed -i 's/<USER>/<YOUR_USER>/g' ciscovpn/openconnect/.env
  sed -i 's/<PASSWD>/<YOUR_PASSWD>/g' ciscovpn/openconnect/.env
  sudo docker-compose up -d
```
