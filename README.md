# Distributed Audit System  

## Introduction
This project provides a platform to set up a private blockchain network as a distributed audit system. Contracts of Ethereum play a role of containers in this scenario to store audit records.   
Each node in this cluster has its own identity, equipped with public and private keys to encrypte records.  
As the server, it can read encrypted audit records of all customers. It owns seven nodes to guarantee consensus mechanism to work well when customers are few.  
As a customer, it can write and read audit data from its own contract. It only interacts with the server, independent of other customers.  
This system is equipped with several characteristics:  
  - Distribution: The whole system is decentralized without the need of a trusted authority.
  - Privacy: All data in contracts are encrypted. Besides, a customer can access to its own contract rather than others'.
  - Safety: Data stored in blockchian are immutable. 
  - Permission: If a new peer want to join the private network, it needs to apply to server for permission.

## Flowchart  
![avatar](./chart.jpg)

## Environment  
Operating system:  
Ubuntu 16.04  
Software version:   
golang 1.9.3, geth 1.7.2  

## Install dependency  
```sh
git clone https://github.com/cosimoth/Distributed_Audit.git 
cd Distributed_Audit
sh ./init_env.sh
./install_dep.sh
```

## Start a server  
```sh
cd ../cluster
# Check configurations in file "./config-cluster.json", including IP addresses and ports
./init_cluster.sh
./start_cluster.sh
```

### Note   
+ Since the server needs to be established on one VM in this example, it should own seven different IP addresses to start its seven nodes.   
The VM on Azure can set its IP configuration as follows:
  1. Azure -> VM -> Network Interface  
  2. Enable IP forwarding  
  3. Add IP configuration with a Static IP address  
  4. Add IP addresses to VM OS by follwing this [document](https://docs.microsoft.com/zh-cn/azure/virtual-network/virtual-network-multiple-ip-addresses-portal#os-config)   

+ We suppose these IP addresses are continuous, sharing a HOST_IP_BASE and starting with a HOST_IP_OFFSET (defined in "config-cluster.json").  
The main IP address of this server is `$HOST_IP`.  
Others are `${HOST_IP_BASE}${HOST_IP_OFFSET}`,   
`${HOST_IP_BASE}$((HOST_IP_OFFSET+1))`, ...,   
`${HOST_IP_BASE}$((HOST_IP_OFFSET+5))`, respectively.  

+ We can also start the server on seven different VMs. In this case, each VM only need to be equipped with one IP address.  
The first node acts as a bootnode, which means other nodes are all connected with it to find other peers in the network.  
However, we need to do the following step "Start a node" for seven times， which is a little time-consuming.  

## Start a node
```sh
cd ../node
# Check configurations in file "./config.json", including IP address and ports
./gene_key.sh
# Save password in ../pw.dat
# Get the command (./run.sh -peer --add ...) from the output, run it on server
# Get the command (./start_node.sh ...) from the output, then start the node with it 
./start_node.sh <RAFT_ID> <contract_addr> <pub_key>
```

## Stop a node  
```sh
cd ../..
killall geth constellation-node
rm -rf Distributed_Audit .qdata
```

## Write and read 
```sh
cd ../util
# Check data directory configuration in "./config-util.json"
# Get help:
./run.sh -help
# Show block number:
./run.sh -block
# Show peer number:
./run.sh -peer --num
# Add a new peer:
./run.sh -peer --add <peer_identity>
# Write audit record:   
./run.sh -write <customer_name> <audit_record>
# Read audit record:  
./run.sh -read <customer_name>
```
