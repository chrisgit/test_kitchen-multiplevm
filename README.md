multiplevm demonstation
======================
When using Test Kitchen, Vagrant and VirtualBox there comes a time when you want to create several Virtual Machines and have them communication with each other.

There are a few things you can do to get a guest virtual machine to talk to another including adding a bridge network, however this will expose your virtual machine to the outside world. There is a simpler solution, if all you need to do get a guest VM to talk to another guest VM then you are in luck as Virtual Box give us a host-only network. The host-only network is a network restricted to VirtualBox VM's on your host.

To use host-only network Virtual Box have provided host only network adapter, the great news is that Vagrant knows and understands about the host-only network adapter.

This demonstration creates a Web Server and a Web Client. For simplicity the way it works is to create a static IP addresses for WebServer and WebClient but you could include DHCP and DNS.

For ease of use I've added an entry for the WebServer in the WebClient hosts file to make it possible to curl or wget with a "hostname" like below
```
curl http://webserver
```

The demonstration uses Test kitchen but the functionality is part of Virtual Box and can be used by Vagrant as a single multi VM Vagrantfile or several single VM Vagrantfiles! 

Requirements
------------
To see this demonstration you will need

    VirtualBox which can be downloaded from here: https://www.virtualbox.org/wiki/Downloads
    Vagrant which can be downloaded from here: https://www.vagrantup.com/downloads.html
    ChefDK which can be downloaded from here: https://downloads.chef.io/chefdk

Tested with VirtualBox 5.1.22 Tested with Vagrant 1.9.5

Usage
-----
After installing the pre-requisites, change to the root folder of this project and run

```
kitchen converge
```

Two boxes will be created, a Web Server and a Web Client.
The Web Server should be running a service called webhello.
Webhello has a single page that can be retrieved on the server itself by calling 
```
curl http://127.0.0.1
```

or from the web client

```
curl http://webserver
```

When finished with the VM's you can destroy them with

```
kitchen destroy
```

Contributing
------------
Get latest. Make changes, write tests, get code review, check in. 

License and Authors
-------------------
Please see [LICENSE][licence]
Authors: Chris Sullivan

[licence]: https://github.com/chrisgit/test_kitchen-multiplevm/blob/master/LICENSE
