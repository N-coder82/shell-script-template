#!/bin/bash

progname="my_bash_script" # Add your program name, which should be your repository name here
error_exit() {
    local RED='\033[0;31m'
    local NC='\033[0m' # No Color
    echo -e "${RED}An error occured:${NC} Please try again."
    rm -rf "$TMPDIR/$progname"
    exit 1
}
cd "$TMPDIR" || error_exit
echo "Downloading $progname..."
git clone https://github.com/MY_GITHUB_USER/$progname.git $progname # REMEMBER TO CHANGE THE USERNAME TO *YOUR* GITHUB USER
cd "$TMPDIR/$progname" || error_exit
echo "Installing... (This may ask for sudo)"
chmod +x $progname.sh
sudo cp $progname.sh /usr/local/bin/$progname || error_exit
cd ..
rm -rf "$TMPDIR/$progname" || error_exit
echo "Finished."