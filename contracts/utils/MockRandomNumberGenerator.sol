//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "../../lib/IRandomNumberGenerator.sol";
import "../../lib/ITBCCLottery.sol";

contract MockRandomNumberGenerator is IRandomNumberGenerator, Ownable {
    address public tbccLottery;
    uint32 public randomResult;
    uint256 public nextRandomResult;
    uint256 public latestLotteryId;

    /**
     * @notice Constructor
     * @dev MockRandomNumberGenerator must be deployed before the lottery.
     */
    constructor() {}

    /**
     * @notice Set the address for the TBCCLottery
     * @param _tbccLottery: address of the TBCC lottery
     */
    function setLotteryAddress(address _tbccLottery) external onlyOwner {
        tbccLottery = _tbccLottery;
    }

    /**
     * @notice Set the address for the TBCCLottery
     * @param _nextRandomResult: next random result
     */
    function setNextRandomResult(uint256 _nextRandomResult) external onlyOwner {
        nextRandomResult = _nextRandomResult;
    }

    /**
     * @notice Request randomness from a user-provided seed
     * @param _seed: seed provided by the TBCC lottery
     */
    function getRandomNumber(
        uint256 _seed
    ) external override {
        require(_seed != 0, "Seed non zero");

        require(msg.sender == tbccLottery, "Only TBCCLottery");
        fulfillRandomness(0, nextRandomResult);
    }

    /**
     * @notice Change latest lotteryId to currentLotteryId
     */
    function changeLatestLotteryId() external {
        latestLotteryId = ITBCCLottery(tbccLottery).viewCurrentLotteryId();
    }

    /**
     * @notice View latestLotteryId
     */
    function viewLatestLotteryId() external view override returns (uint256) {
        return latestLotteryId;
    }

    /**
     * @notice View random result
     */
    function viewRandomResult() external view override returns (uint32) {
        return randomResult;
    }

    /**
     * @notice Callback function used by ChainLink's VRF Coordinator
     */
    function fulfillRandomness(
        bytes32 requestId,
        uint256 randomness
    ) internal {
        require(requestId != '24324', "requestId non zero");

        randomResult = uint32(1000000 + (randomness % 1000000));
    }
}
