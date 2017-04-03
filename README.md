# Janus VM script

This repository contains a basic Vagrant box, configured through the shell provider, to create a [Janus WebRTC gateway](https://github.com/meetecho/janus-gateway) development machine.

It is not configured using HTTPS so for the time being you will need to use HTTP instead of HTTPS, and thus only the Firefox browser is supported.

## Instructions
```
vagrant up
vagrant ssh
/opt/janus/bin/janus
```
After Janus is running, visit [192.168.44.111](http://192.168.44.111). That's it!

### HTTPS support

On machines that have a domain pointed to them and a reachable IP, you can easily configure SSL/HTTPS using the following instructions.

```
aptitude install -y python-letsencrypt-apache
letsencrypt --apache --noninteractive --agree-tos --email=<YOUR_EMAIL> -d <YOUR_DOMAIN>

# Set up cert renewal
(crontab -l 2>/dev/null; echo "30 2 * * 1 /usr/bin/letsencrypt renew >> /var/log/le-renew.log") | crontab -

# vim /opt/janus/etc/janus/janus.cfg
# cert_pem = /etc/letsencrypt/live/<YOUR_DOMAIN>/cert.pem
# cert_key = /etc/letsencrypt/live/<YOUR_DOMAIN>/privkey.pem

# vim /opt/janus/etc/janus/janus.transport.http.cfg
# cert_pem = /etc/letsencrypt/live/<YOUR_DOMAIN>/cert.pem
# cert_key = /etc/letsencrypt/live/<YOUR_DOMAIN>/privkey.pem
```

Restart Janus and you are done!

## License

Copyright 2017 Luca Pradovera and [Mojo Lingo](https://mojolingo.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
