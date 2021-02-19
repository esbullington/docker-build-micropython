apt-get update
apt-get -y -qq install build-essential libreadline-dev libffi-dev git pkg-config gcc-arm-none-eabi libnewlib-arm-none-eabi

cd /app/micropython/mpy-cross
make
cd ../ports/unix

make axtls
make
