#!/bin/bash

echo "🧹 Old node data is being cleared..."
rm -rf /root/.aztec/alpha-testnet

echo "🚀 Aztec node is starting.."

# Kullanıcıdan bilgileri al
read -p "🔗 Sepolia RPC : " RPC_URL
read -p "🔑 Metamask private key: " PRIVATE_KEY
read -p "📬 Metamask wallet address: " COINBASE
read -p "🌐 Server IP: " IP_ADDR

# Node'u başlat
aztec start --node --archiver --sequencer \
  --network alpha-testnet \
  --l1-rpc-urls "$RPC_URL" \
  --l1-consensus-host-urls https://rpc.drpc.org/eth/sepolia/beacon \
  --sequencer.validatorPrivateKey "$PRIVATE_KEY" \
  --sequencer.coinbase "$COINBASE" \
  --p2p.p2pIp "$IP_ADDR"
