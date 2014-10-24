# Packaging Tool for HAW Hamburg

## What do you try to solve with this?
I want an infrastructure for organizing my lecture material in an orderly fashion. The aim of this project is to provide one simple interface for updating all neccessary documents and information you need, to stay up to date with your lecture.

## Architecture
Every lecture is defined in "build scripts". Basicly if you write a script and host it on github. This script gathers all information from the network storage (haw pub) and exports them into a specific location on your file system. It is compareable with the idea of package systems found on various gnu/linux distributions.
To obtain the "build scripts" there has to be an index of some sort. This is done via hosting an index file holding links to the repositories hosting the build scripts for various lectures. This index can be hosted by yourself, or you can use mine found at ```github.com/blurryroots/h3pkg-index```.

## Technology
For now, this project is purly implemented in (sadly not really POSIX complient) shell script. So this means, only unix like systems may use h3pkg. For now there are no plans to reimplement this for other platforms. If you have interest in such an undertaking please feel free to contact me, or better yet, just fork this and start porting =)

## Usage

### Setup
For now, this is all purly w
Firstly setup your installation home path (```H3PKG_HOME```) and package home (```H3PKG_PACKAGE_HOME```) found in ```main.sh```.
After that make sure you source ```main.sh``` somewhere in your user configuration, eg. if your using bash, put ```source <path to h3pkg>/main.sh``` at the end of your ```.bashrc```.
Now type ```h3pkg``` to test if the setup was successful. Don't foget to restart your shell, to make sure your config has been updated.

### Index
You can use my index (default value), or setup your own index. To do this, just fork ```github.com/blurryroots/h3pkg-index```, change things and change to index location in ```main.sh``` to point to your repository.

### Syncing
To update the index used by h3pkg type ```h3pkg sync``` which will fetch the index file.

### Installing
To install a "package" type ```h3pkg install <package name>```, which will fetch the "build script" from the location found in the index file. After that the "build script" will try to connect to the haw remote server, which will promt you for your password. In the future, i may implement the usage of certificates for login, to avoid typing in your credentials. Now the raw files get synced, packaged according to the build script and put into the location defined in ```$H3PKG_PACKAGE_HOME```.
