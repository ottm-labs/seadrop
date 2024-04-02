#!/usr/bin/env bash
if [[ -z $1 ]]; then
  echo "Error: Argument 1 is not set. Please provide either 'porcini' or 'root'."
  exit 1
fi

if [[ $1 == "porcini" ]]; then
  RPC_URL="https://porcini.rpc-moai-finance.xyz/archive"
elif [[ $1 == "root" ]]; then
  RPC_URL="https://mainnet.rpc-moai-finance.xyz/archive"
else
  echo "Error: Invalid argument. Please provide either 'porcini' or 'root'."
  exit 1
fi

forge create \
  --rpc-url $RPC_URL \
  --private-key $CALLER_PRIVATE_KEY \
  --legacy \
  --verify \
  --verifier sourcify \
  --constructor-args 0 \
  --optimize \
  --optimizer-runs 10000000 \
  src/SeaDrop.sol:SeaDrop