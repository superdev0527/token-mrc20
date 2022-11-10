const { expect } = require("chai");
const { BigNumber } = require("ethers");
const { ethers } = require("hardhat");

describe("BIGToken", function() {
  it("Should return the new greeting once it's changed", async function() {
    const Greeter = await ethers.getContractFactory("BIGToken");
    const greeter = await Greeter.deploy();
    
    console.log("1");
    await greeter.deployed();
    console.log("2");
    const [owner, test1] = await ethers.getSigners()
    await greeter.connect(owner).transferFrom(owner.address, test1.address, BigNumber.from("10000"));
    expect(await greeter.balanceOf(test1.address)).to.be.equal(BigNumber.from("10000"));
  });
});
