
aztec-up alpha-testnet


ufw allow 22
ufw allow ssh
ufw allow 40400
ufw allow 8080
echo "y" | ufw enable


read -p "🔗 Sepolia RPC : " RPC_URL
read -p "🔑 Metamask private key: " PRIVATE_KEY
read -p "📬 Metamask wallet address: " COINBASE
read -p "🌐 Server IP: " IP_ADDR


START_COMMAND="aztec start --node --archiver --sequencer \
  --network alpha-testnet \
  --l1-rpc-urls $RPC_URL \
  --l1-consensus-host-urls https://rpc.drpc.org/eth/sepolia/beacon \
  --sequencer.validatorPrivateKey $PRIVATE_KEY \
  --sequencer.coinbase $COINBASE \
  --p2p.p2pIp $IP_ADDR"


screen -dmS aztec bash -c "$START_COMMAND"

echo " "
echo " "
echo " "
echo -e "${BLUE} ######   ######    ####    ##   ##    ####   ##   ##  #######    ####    #####    ####    ##   ##   #####${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     ###  ##   ##  ##  ### ###   ##   #   ##  ##  ##   ##    ##     ###  ##  ##   ##${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     #### ##  ##       #######   ## #    ##       ##   ##    ##     #### ##  #${NC}"
echo -e "${BLUE}  #####    #####     ##     ## ####  ##       #######   ####    ##       ##   ##    ##     ## ####   #####${NC}"
echo -e "${BLUE}  ##  ##   ## ##     ##     ##  ###  ##  ###  ## # ##   ## #    ##       ##   ##    ##     ##  ###       ##${NC}"
echo -e "${BLUE}  ##  ##   ##  ##    ##     ##   ##   ##  ##  ##   ##   ##   #   ##  ##  ##   ##    ##     ##   ##  ##   ##${NC}"
echo -e "${BLUE} ######   #### ##   ####    ##   ##    #####  ##   ##  #######    ####    #####    ####    ##   ##   #####${NC}"
echo " "
echo " "
echo " "
echo " "


echo "✅ Aztec node is started in the screen."
echo " "
echo "🔍 Log control : screen -r aztec"
echo " "
echo " x.com/BringMeCoins"
