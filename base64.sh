#!/bin/bash


BLOCK_NUM=$(curl -s -X POST -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","method":"node_getL2Tips","params":[],"id":67}' \
  http://localhost:8080 | jq -r ".result.proven.number")

echo "🔢 Last block number: $BLOCK_NUM"


PROOF=$(curl -s -X POST -H 'Content-Type: application/json' \
  -d "{\"jsonrpc\":\"2.0\",\"method\":\"node_getArchiveSiblingPath\",\"params\":[\"$BLOCK_NUM\",\"$BLOCK_NUM\"],\"id\":67}" \
  http://localhost:8080 | jq -r ".result")

echo -e "\n📦 Base64 Proof:\n$PROOF"
