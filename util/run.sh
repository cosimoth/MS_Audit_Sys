#!/bin/bash

. ./read_data.func

QDATA_DIR=`jq -r '.QDATA_DIR' ./config-util.json`
CON_DD=`jq -r '.CON_DD' ./config-util.json`
QUO_DD=`jq -r '.QUO_DD' ./config-util.json`
ATTACHPARAMETER="ipc:${QDATA_DIR}/${QUO_DD}/geth.ipc"
ABI='[{"constant":true,"inputs":[{"name":"idx","type":"uint256"}],"name":"get_record","outputs":[{"name":"retVal","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"get_num","outputs":[{"name":"num","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"record","type":"string"}],"name":"put","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"get_info","outputs":[{"name":"info","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"_info","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"_dataStore","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"info","type":"string"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]'
BYTE='"0x608060405273ed9d02e382b34818e88b88a309c7fe71e65f419d600360006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555034801561006557600080fd5b50604051610ac5380380610ac5833981018060405281019080805182019291906020018051906020019092919050505081600190805190602001906100ab9291906100f4565b5080600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505050610199565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061013557805160ff1916838001178555610163565b82800160010185558215610163579182015b82811115610162578251825591602001919060010190610147565b5b5090506101709190610174565b5090565b61019691905b8082111561019257600081600090555060010161017a565b5090565b90565b61091d806101a86000396000f30060806040526004361061006d576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806310ea9142146100725780633e27a8e8146101185780634c21eb0714610143578063605834881461022557806367cd8361146102b5575b600080fd5b34801561007e57600080fd5b5061009d6004803603810190808035906020019092919050505061030c565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156100dd5780820151818401526020810190506100c2565b50505050905090810190601f16801561010a5780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561012457600080fd5b5061012d6104b6565b6040518082815260200191505060405180910390f35b34801561014f57600080fd5b506101aa600480360381019080803590602001908201803590602001908080601f0160208091040260200160405190810160405280939291908181526020018383808284378201915050505050509192919290505050610524565b6040518080602001828103825283818151815260200191508051906020019080838360005b838110156101ea5780820151818401526020810190506101cf565b50505050905090810190601f1680156102175780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b34801561023157600080fd5b5061023a610691565b6040518080602001828103825283818151815260200191508051906020019080838360005b8381101561027a57808201518184015260208101905061025f565b50505050905090810190601f1680156102a75780820380516001836020036101000a031916815260200191505b509250505060405180910390f35b3480156102c157600080fd5b506102ca610822565b604051808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b6060600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141580156103ba5750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b156103fc576040805190810160405280601181526020017f5065726d697373696f6e2064656e69656400000000000000000000000000000081525090506104b1565b60008281548110151561040b57fe5b906000526020600020018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156104a95780601f1061047e576101008083540402835291602001916104a9565b820191906000526020600020905b81548152906001019060200180831161048c57829003601f168201915b505050505090505b919050565b6000600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415156105185760009050610521565b60008054905090505b90565b6060600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16141580156105d25750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b15610614576040805190810160405280601181526020017f5065726d697373696f6e2064656e696564000000000000000000000000000000815250905061068c565b600082908060018154018082558091505090600182039060005260206000200160009091929091909150908051906020019061065192919061084c565b50506040805190810160405280600e81526020017f5265636f7264207772697474656e00000000000000000000000000000000000081525090505b919050565b6060600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161415801561073f5750600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614155b15610781576040805190810160405280601181526020017f5065726d697373696f6e2064656e696564000000000000000000000000000000815250905061081f565b60018054600181600116156101000203166002900480601f0160208091040260200160405190810160405280929190818152602001828054600181600116156101000203166002900480156108175780601f106107ec57610100808354040283529160200191610817565b820191906000526020600020905b8154815290600101906020018083116107fa57829003601f168201915b505050505090505b90565b6000600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16905090565b828054600181600116156101000203166002900490600052602060002090601f016020900481019282601f1061088d57805160ff19168380011785556108bb565b828001600101855582156108bb579182015b828111156108ba57825182559160200191906001019061089f565b5b5090506108c891906108cc565b5090565b6108ee91905b808211156108ea5760008160009055506001016108d2565b5090565b905600a165627a7a723058204abe3eb3dea7ddf7669461ab678821faae2b753277693b50035624f6ca8c0cae0029"'

# -peer command
if [ "$1"x == "-peer"x ]; then
  
  # --num option
  if [ "$2"x == "--num"x ]; then
    # PRIVATE_CONFIG=${QDATA_DIR}/${CON_DD}/tm.ipc geth attach $ATTACHPARAMETER <<EOF | grep "Data: " | sed "s/Data: //"
    OUT=`PRIVATE_CONFIG=${QDATA_DIR}/${CON_DD}/tm.ipc geth attach $ATTACHPARAMETER <<EOF
    net.peerCount;
    exit;
EOF`
  RES=`echo $OUT  | cut -d '>' -f 2`
  echo "Current peer number (except self) is:$RES"
  
  # --add option
  elif [ "$2"x == "--add"x ]; then
    if [ $# -ne 4 ]; then
      echo 'Wrong arguments. Please check.'
      exit
    fi
    touch ${QDATA_DIR}/.addresses.dat
    OUT=`PRIVATE_CONFIG=${QDATA_DIR}/${CON_DD}/tm.ipc geth attach $ATTACHPARAMETER <<EOF
    raft.addPeer("$3");
    exit;
EOF`
    RES=`echo $OUT | cut -d '>' -f 2 | cut -d ' ' -f 2`
    if [ "$RES"x == "Error:"x ]; then
      echo 'Wrong Enode URL. Please check.'
    else
      echo "RADT ID of the new node is:$RES"
      new_contract_get_addr $RES $QDATA_DIR $CON_DD $QUO_DD $4
    fi
  
  # wrong option
  else
    show_help
  fi
  
# -block command
elif [ "$1"x == "-block"x ]; then
  OUT=`PRIVATE_CONFIG=${QDATA_DIR}/${CON_DD}/tm.ipc geth attach $ATTACHPARAMETER <<EOF
  eth.blockNumber;
  exit;
EOF`
  RES=`echo $OUT  | cut -d '>' -f 2`
  echo "Current block number is:$RES"
  
# -write command
elif [ "$1"x == "-write"x ]; then
  if [ $# -eq 1 ]; then
    echo 'Blank input is not allowed.'
    exit
  fi
  while read LINE;
  do
    CUSTOMER=`echo $LINE | cut -d " " -f 1`
    if [ "$CUSTOMER"x == "$2"x ]; then
      ADDRESS=`echo $LINE | cut -d " " -f 2`
      sed -i -e "s/var mess.*/var mess=\"$2\";/" write_exist_contract.js
      sed -i -e "s/var address.*/var address=\"$ADDRESS\";/" write_exist_contract.js 
      OUT=`PRIVATE_CONFIG=${QDATA_DIR}/${CON_DD}/tm.ipc geth --exec "loadScript(\"write_exist_contract.js\")" attach ipc:${QDATA_DIR}/${QUO_DD}/geth.ipc` 
      exit
    fi
  done  < ${QDATA_DIR}/.addresses.dat
  echo "No $3 found. Please check."

# -data command
elif [ "$1"x == "-read"x ]; then
  
  # --cust option
  if [ "$2"x == "--cust"x ]; then
    while read LINE;
    do
      # echo $LINE
      CUSTOMER=`echo $LINE | cut -d " " -f 1`
      if [ "$CUSTOMER"x == "$3"x ]; then
        ADDRESS=`echo $LINE | cut -d " " -f 2`
        get_data_via_address $ATTACHPARAMETER $QDATA_DIR $CON_DD $ABI $ADDRESS
        exit
      fi
    done  < ${QDATA_DIR}/.addresses.dat
    echo "No $3 found. Please check."
    
  # --addr option
  elif [ "$2"x == "--addr"x ]; then 
    ADDRESS=$3
    get_data_via_address $ATTACHPARAMETER $QDATA_DIR $CON_DD $ABI $ADDRESS
    
  # wrong option
  else
    show_help
  fi
  
# -help command & wrong command
else
  show_help
fi
