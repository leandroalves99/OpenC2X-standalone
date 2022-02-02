## OpenC2X Standalone
This version of OpenC2X is patched to work only with the latest version of Debian (Debian 11), at the time of writting. Maybe it works with Ubuntu 20.04 LTS, but I didn't tested it.

### Installation 
Before proceeding to the installation of OpenC2X, it's necessary to install UCI, or OpenC2X won't build.
To install UCI do the following:
1. Install required dependencies  
    ```
    apt install cmake lua5.2
    ```
2. Since UCI depends on libubox library, libubox needs to be installed:  
    ```
    git clone git://nbd.name/luci2/libubox.git libubox  
    cd libubox
    ```
3. Build and install libubox:  
    ```
    mkdir build && cd build  
    cmake ..
    make ubox
    ```
    ```
    sudo mkdir -p /usr/local/include/libubox
    sudo cp ../*.h /usr/local/include/libubox
    sudo cp libubox.so /usr/local/lib
    sudo ldconfig
    ```
4. Get UCI from git:  
    ```
    git clone git://nbd.name/uci.git uci
    cd uci
    ```
5. Build and install UCI:  
    ```
    mkdir build && cd build
    cmake ..
    make uci cli
    ```
    ```
    sudo mkdir -p /usr/local/include/uci
    sudo cp ../uci.h ../uci_config.h /usr/local/include/uci
    sudo cp ../uci_blob.h ../ucimap.h /usr/local/include/uci
    sudo cp libuci.so /usr/local/lib
    sudo cp uci /usr/local/bin
    sudo ldconfig
    ```

To build OpenC2X, do:  
1. Install dependencies required by OpenC2X:
    ```
    apt install libboost-all-dev protobuf-compiler libnl-genl-3-dev asn1c libzmq3-dev libgps-dev libsqlite3-dev
    ```

2. Clone this repository:  
    ```
    git clone https://github.com/leandroalves99/OpenC2X-standalone.git
    cd OpenC2X-standalone
    ```

3. Build and install OpenC2X:  
    ```
    mkdir build && cd build
    cmake ..
    make clean
    make
    make install #sudo is required if it's executed by normal user
    ```

----------------------------------------------------------------------------------------------------
3)                                      Configurations
----------------------------------------------------------------------------------------------------
- The configuration of the modules can be changed in '/etc/config/'
- Make sure to change the interface name and the stationId as per your setup.
- For setting up OpenC2X kernel, go through 'kernel-patches/README.txt'



----------------------------------------------------------------------------------------------------
4)                                        Start OpenC2X
----------------------------------------------------------------------------------------------------
If you have followed the above steps, then you are ready to run OpenC2X.

    $ sudo runOpenC2X.sh

For the GUI, open 'webSite/index.html' in your browser. You can also trigger denms from there.
You can stop your experiment by running stopOpenC2X.sh in another terminal.
