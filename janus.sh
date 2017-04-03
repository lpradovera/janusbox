apt-get -y install aptitude git
aptitude update
aptitude install -y libmicrohttpd-dev libjansson-dev libnice-dev libssl-dev libsofia-sip-ua-dev libglib2.0-dev libopus-dev libogg-dev libcurl4-openssl-dev pkg-config gengetopt libtool automake libcurl4-openssl-dev apache2

cd /usr/local/src

wget https://github.com/cisco/libsrtp/archive/v2.0.0.tar.gz
tar xfv v2.0.0.tar.gz
cd libsrtp-2.0.0
./configure --prefix=/usr --enable-openssl
make shared_library && make install

cd ..

git clone https://github.com/meetecho/janus-gateway.git
cd janus-gateway
sh autogen.sh
./configure --prefix=/opt/janus
make
make install
make configs

cp -a /usr/local/src/janus-gateway/html/. /var/www/html/


