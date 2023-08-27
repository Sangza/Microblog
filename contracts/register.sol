// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Registry {
    mapping(bytes32 => address) public owners;
    mapping(bytes32 => address) public resolvers;


    function setOwner(bytes32 node, address owner) external {
        owners[node] = owner;
    }

    function setResolver(bytes32 node, address resolver) external  {
        resolvers[node] = resolver;
    }
}
