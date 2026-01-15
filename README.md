# sapience_autopilot

```
git submodule update --init --recursive
sudo apt update
sudo apt install -y gcc-arm-none-eabi python3-pip
pip3 install kconfiglib pyros-genmsg jinja2 jsonschema future

source /opt/ros/humble/local_setup.bash


cmake -B build .
cmake --build build -j$(nproc) -t install
```

## ardupilot
```
./third_party/ardupilot/Tools/environment_install/install-prereqs-ubuntu.sh -y
. ~/.profile
```