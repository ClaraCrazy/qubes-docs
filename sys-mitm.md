# <ins>Sys-mitm</ins>

![2023-03-26-101056](https://user-images.githubusercontent.com/55334727/227768983-15da35e4-3594-497d-b809-e3dbb3451b86.png)

A man-in-the-middle Qube for your traffic analysis needs.

Sys-mitm uses "mitmproxy" on a standalone qube to act as a middleman between your sys-firewall (or sys-vpn) qube and your untrusted qube. Setting this up is incredibly simple too:

-----

- Create a qube:
  - Sys-mitm, standalone, provides network, based on fedora, no disposable template

<br>

- Install [mitmproxy](https://github.com/mitmproxy/mitmproxy):
  - Download the latest archive & extract it, **or** build it from source.

<br>

- Add the following iptables rules to mitmproxy-qube:

    ```console
    sudo iptables -t nat -A PR-QBS -i vif+ -p tcp --dport 80 -j REDIRECT --to-port 8080
    sudo iptables -t nat -A PR-QBS -i vif+ -p tcp --dport 443 -j REDIRECT --to-port 8080
    sudo iptables -t filter -I INPUT -i vif+ -p tcp -m tcp --dport 8080 -j ACCEPT
    ```
    The first two rules redirect any TCP packets from attached qubes with destination port 80 or 443 to get redirected to port 8080, which mitmproxy will be listening on.

    The third rule ensures that the redirection is allowed. Otherwise, there is a default firewall rule to REJECT input packets from vif interfaces (these are attached qubes).
<br>

- Run mitmweb:
  - `./mitmweb`

<br>

- Install the mitmproxy CA Certificate on the qubes you wish to analyse

  - In Fedora, copy the cert to `/etc/pki/ca-trust/source/anchors/` and run `sudo update-ca-trust extract`
  - In Debian, copy it to `/usr/local/share/ca-certificates` and run `sudo update-ca-certificates`
  - In Firefox, import it under Privacy & Security -> Certificate settings

<br>

- Confirm that mitmproxy works by doing a curl request on a qube that is set to route traffic through `sys-mitm`

<br>

- Now, if that all works we can add mitmweb into `rc.local` to make sure mitm loads on VM startup:
  - `sudo nano /rw/config/rc.local`

  ```console
  while ! ping -c 1 -W 1 1.1.1.1; do
    sleep 1
  done
  /path/to/mitmweb
  ```
  
  This will launch mitmweb as soon as the VM started and we got internet.

<br>

-----

<p align="center">ClaraCrazy | CynthiaLabs - 2023
