const { ethers, run, network } = require("hardhat")

require("dotenv").config()

async function main() {
    const HungerGamesFactory = await ethers.getContractFactory("HungerGames")
    console.log("Deploying, please wait...")
    const HungerGames = await HungerGamesFactory.deploy()
    await HungerGames.deployed()
    console.log(`Deployed contract to: ${HungerGames.address}`)
    console.log(network.config)
    if (network.config.chainId === 5 && process.env.ETHERSCAN_API_KEY) {
        console.log("Waiting for block confirmations...")
        await HungerGames.deployTransaction.wait(6)
        await verify(HungerGames.address, [])
    }

    const currentValue = await HungerGames
}

async function verify(contractAddress, args) {
    console.log("Verifying contract...")
    try {
        await run("verify:verify", {
            address: contractAddress,
            constructorArguments: args,
        })
    } catch (e) {
        if (e.message.toLowerCase().includes("already verified")) {
            console.log("Already Verified!")
        } else {
            console.log(e)
        }
    }
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error)
        process.exit(1)
    })
