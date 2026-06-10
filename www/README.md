# WiiMart Hosting Guide

## Information

In this repository, there are two things to be aware of:

1. `www` - This is the root folder of the web server that will be hosted. This is **required** to host WiiMart
2. `main.mjs` - This used to be the old catalog server, but is now only used for dumping EC logs. This is **not required**

## Prerequisites

In order to host WiiMart locally and to connect to the local WiiMart server on a Wii, you must have the following downloaded/installed:

1. [Apache Tomcat](https://tomcat.apache.org/)
2. This repository
3. dnsmasq (installable through your package manager on Linux and Homebrew on MacOS. Acryllic DNS for Windows might work but has not been tested) or another DNS server (only needed if connecting on real Wii/Wii U)
4. [WiiMart-Patcher](https://github.com/WiiMart/WiiMart-Patcher) for your system from our forked repository (our fork fixes an issue where running the shop could cause all titles on the system to be deleted).
5. Java 21
6. PostgreSQL and the PostgreSQL Java driver
7. JSON Java library
8. CORS Java library

## Linux/MacOS Instructions

1. Grab Apache Tomcat from the link above and extract the zip anywhere on your computer
2. Git clone this repository by running `git clone https://github.com/WiiMart/WiiMart.git`.
3. Copy the `www` folder in this repository to `{tomcat folder}/webapps`.
4. Copy the PostgreSQL Java driver, the JSON Java library, and the CORS Java library to `{tomcat folder}/lib`.
5. Replace `{tomcat folder}/conf/server.xml` with `server.example.xml` in this repository and rename it back to `server.xml`
6. Follow [the domain patching guide](#custom-domain-patching) to generate a WAD and server certificates
7. Copy the generated `server.pem` and `server.key` to `{tomcat folder}/certs/` and rename `server.pem` and `server.key` to `WiiMart.pem` and `WiiMart.key` respectively.
8. Open a psql session and create a user named `wiisoap` with password `wiisoap` and admin privelages and a database named `wiisoap`, owned by the `wiisoap` user.
9. Import `schema.sql` into the `wiisoap` database (Do `\i path/to/schema.sql` while logged into the `wiisoap` database as `wiisoap`).
10. Now, your `java.security` file for your installed Java version needs to be edited to allow old versions of TLS and SSL to function within Tomcat to allow Wiis to connect. Find your `java.security` file and find the line that contains `jdk.tls.disabledAlgorithms=`. Delete everything after the `=` so that it becomes just `jdk.tls.disabledAlgorithms=`. Save and close the file. (`export JAVA_OPTS="$JAVA_OPTS -Djdk.tls.disabledAlgorithms="` can also be put in `{tomcat folder}/bin/setenv.sh` to ensure that no TLS/SSL algorithms are disabled).
11. (Might not be required, but better to be safe than sorry) Lower your OpenSSL security settings by editing your `openssl.cnf` file:
    - Add `openssl_conf = default_conf` to the beginning of your config file.
    - Add the following code block to the end of your config file:

```ini
[default_conf]

ssl_conf = ssl_sect

[ssl_sect]

system_default = system_default_sect

[system_default_sect]
MinProtocol = TLSv1
CipherString = ALL:@SECLEVEL=0
```

Source: [Ubuntu 20.04 - how to set lower SSL security level?](https://askubuntu.com/questions/1233186/ubuntu-20-04-how-to-set-lower-ssl-security-level)

12. (If you are using Dolphin, this step is not necessary) Setup dnsmasq or another DNS server:
    - Find your `dnsmasq.conf` file and make sure only the following is in it:

```conf
expand-hosts
listen-address={insert your computer's local IPv4},{insert your computer's local IPv6}
cache-size=1000
port=53
server=8.8.8.8
server=8.8.4.4
address=/oss-auth.a.taur.cloud/{insert your computer's local IP}
server=/oss-auth.a.taur.cloud/{insert your computer's local IP} # Might not be needed (NEEDS TESTING)

log-facility=/var/log/dnsmasq.log
log-queries=extra
```  

13. After all of that, run the startup file in `{tomcat folder}/bin` for your system (`startup.sh` for Linux/MacOS and `startup.bat` for Windows).
14. Install the patched shop WAD onto your Wii / Dolphin and launch the shop!

## Custom Domain Patching

In order to patch a custom domain into the Wii Shop Channel, use WSC-Patcher, which should be downloaded already.
Follow the README in the repository for WiiMart-Patcher to generate a patched WAD and server certificates.
