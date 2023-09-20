console.log("Hello")

require("dotenv")

const aptos = require("aptos");

const NODE_URL =  process.env.APTOS_NODE_URL || "https://fullnode.devnet.aptoslabs.com"

const FAUCET_URL = process.env.APTOS_FAUCT_URL || "https://faucet.devnet.aptoslabs.com"

const aptosCoin = "0x1::coin::CoinStore<0x1::aptos_coin::AptosCoin>";


    const check = async () =>{

        const client = new aptos.AptosClient(NODE_URL);
        const faucetClient = new aptos.FaucetClient(NODE_URL,FAUCET_URL,null);
        const privateKey = new aptos.HexString("0x66a0db46365bb5692c4efe33f499682cf1485696ab16ada4b143d2cd43607adf");
        const account1 = new aptos.AptosAccount(privateKey.toUint8Array());
        // await faucetClient.fundAccount(account1.address(),100000000)
        console.log(`account1 address:${account1.address()}`);

        let resources = await client.getAccountResources(account1.address())

        let accountResource = resources.find((r)=>r.type === aptosCoin);

        console.log(`Account2 Coins : ${accountResource.data.coin.value}`);



        const payload = {
            type:"entry_function_payload",
            function: "0xd7caab487d91a94043ef0c8d26b39059fa54e895395d05dceec0e81393a1ac7d::Game::createStarBy",
            type_arguments: [],
            arguments: [6],
          };

        // const txnRequest = await client.generateTransaction(account1.address(),payload)
        const rawTxn = await client.generateTransaction(account1.address(), payload);
        await client.waitForTransaction(rawTxn.hash)
        // console.log(rawTxn.hash);

        // const signedTxn = await client.signTransaction(account1,txnRequest);

        // const transactionResponse = await client.submitTransaction(signedTxn);

        // await client.waitForTransaction(transactionResponse.hash)

        // console.log(transactionResponse.hash);


    }

    check();




