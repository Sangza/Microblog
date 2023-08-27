// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface Resolver {
    function setAddr(bytes32 node, address addr) external;
    // Add more record-setting functions here
}

contract SimpleResolver is Resolver {
    mapping(bytes32 => address) public addresses;

    function setAddr(bytes32 node, address addr) external override {
        addresses[node] = addr;
    }
}
