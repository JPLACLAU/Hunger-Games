const { ethers } = require("hardhat")
const { expect, assert } = require("chai")

describe("HungerGames", function () {
    let HungerGamesFactory, HungerGames
    beforeEach(async function () {
        HungerGamesFactory = await ethers.getContractFactory("HungerGames")
        HungerGames = await HungerGamesFactory.deploy()
    })

    it("Should start with a person number of 0", async function () {
        const currentValue = await HungerGames.retrieve()
        const expectedValue = "0"
        assert.equal(currentValue.toString(), expectedValue)
    })
})
