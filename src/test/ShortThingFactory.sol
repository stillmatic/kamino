// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "./Thing.sol";
import "../CloneFactory17.sol";

contract ShortThingFactory is CloneFactory17 {
    address public libraryAddress;

    event ThingCreated(address newThingAddress, address libraryAddress);

    constructor(address _libraryAddress) {
        libraryAddress = _libraryAddress;
    }

    function onlyCreate() public {
        createClone(libraryAddress);
    }

    function createThing(string memory _name, uint256 _value) public {
        address clone = createClone(libraryAddress);
        Thing(clone).init(_name, _value);
        emit ThingCreated(clone, libraryAddress);
    }

    function isThing(address thing) public view returns (bool) {
        return isClone(libraryAddress, thing);
    }
}
