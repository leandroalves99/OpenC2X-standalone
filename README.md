## OpenC2X Standalone
This version of OpenC2X is patched to work only with the latest version of Debian (Debian 11), at the time of writting. Maybe it works with Ubuntu 20.04 LTS, but I didn't tested it.

### Installation 
Before proceeding to the installation of OpenC2X, it's necessary to install UCI, or OpenC2X won't build.
To install UCI do the following:
1. Install required dependencies  
    ```
    apt install cmake lua5.1 liblua5.1-0-dev libjson-c-dev
    ```
2. Since UCI depends on libubox library, libubox needs to be installed:  
    ```
    git clone git://git.openwrt.org/project/libubox.git  
    cd libubox
    ```
3. Build and install libubox:  
    ```
    mkdir build && cd build  
    cmake ..
    make ubox
    sudo make install
    ```
4. Get UCI from git:  
    ```
    git clone git://git.openwrt.org/project/uci.git
    cd uci
    ```
5. Build and install UCI:  
    ```
    mkdir build && cd build
    cmake ..
    make
    sudo make install
    ```
6. Update library links
    ```
    sudo ldconfig /usr/local/lib
    ```

To build OpenC2X, do:  
1. Install dependencies required by OpenC2X:
    ```
    apt install libboost-all-dev protobuf-compiler libnl-genl-3-dev asn1c libzmq3-dev libgps-dev libsqlite3-dev tmux
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
    sudo make install
    ```
    
### Starting OpenC2X
If the previous steps worked correctly, then OpenC2X is ready to run. To do so, just run the following:
```
./scripts/runOpenC2X.sh     #To start OpenC2X
./scripts/stopOpenC2X.sh    #To stop OpenC2X
```  
To access GUI, open **localhost:8000** in your browser. If OpenC2X is running in a remote machine, change localhost to your machine's ip address.
