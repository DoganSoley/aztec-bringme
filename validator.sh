#!/bin/bash

echo "🛡️  Aztec Validator Registry"

# Kullanıcıdan bilgileri al
read -p "🔗 Sepolia RPC : " RPC_URL
read -p "🔐 Metamask private key: " PRIVATE_KEY
read -p "📬 Metamask wallet address: " VALIDATOR_ADDRESS

# Sabit parametreler
STAKING_HANDLER="0xF739D03e98e23A7B65940848aBA8921fF3bAc4b2"
CHAIN_ID="11155111"

# Komutu çalıştır ve çıktıyı değişkende tut
echo -e "\n🚀 Registered as Validator..."
OUTPUT=$(aztec add-l1-validator \
  --l1-rpc-urls "$RPC_URL" \
  --private-key "$PRIVATE_KEY" \
  --attester "$VALIDATOR_ADDRESS" \
  --proposer-eoa "$VALIDATOR_ADDRESS" \
  --staking-asset-handler "$STAKING_HANDLER" \
  --l1-chain-id "$CHAIN_ID" 2>&1)

# Quota hatası kontrolü
if echo "$OUTPUT" | grep -q "ValidatorQuotaFilledUntil"; then
  echo -e "\n❌ The daily validator registration quota may have been reached, try again tomorrow."
elif echo "$OUTPUT" | grep -q "insufficient funds"; then
  echo -e "\n❌ There may not be enough Sepolia ETH in your account or there may be a problem in calculating the fee. If you have enough ETH in your wallet, try later."
elif echo "$OUTPUT" | grep -q "Successfully added"; then
  echo -e "\n✅ Validator has been successfully registered."
else
  echo -e "\n⚠️ An unexpected error occurred:\n$OUTPUT"
fi
