// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MicroDonationPool {
    // Replace this with the real charity address before deploying.
    address payable public constant CHARITY = payable(0x1111111111111111111111111111111111111111);

    // Track donor contributions (optional helpful bookkeeping)
    mapping(address => uint256) public donations;
    uint256 public totalDonations;

    // Events
    event DonationReceived(address indexed donor, uint256 amount);
    event WithdrawnToCharity(address indexed charity, uint256 amount);

    // Simple reentrancy guard (no imports)
    bool private locked;
    modifier noReentrant() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    /// @notice Donate to the common pool. No input fields required.
    function donate() external payable {
        require(msg.value > 0, "Send ETH to donate");
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    /// @notice Withdraw entire pool to the predefined charity address. No input fields required.
    /// Anyone may call this; funds are forwarded to the charity address.
    function withdrawAll() external noReentrant {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");

        // Forward all funds to charity
        (bool success, ) = CHARITY.call{value: balance}("");
        require(success, "Transfer failed");

        emit WithdrawnToCharity(CHARITY, balance);
    }

    // Allow direct ETH transfers to be treated as donations
    receive() external payable {
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    fallback() external payable {
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }
}
