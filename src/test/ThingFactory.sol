// SPDX-License-Identifier: MIT
pragma solidity >=0.4.23;

import "./Thing.sol";
import "../CloneFactory.sol";

contract ThingFactory is CloneFactory {
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

    function incrementThings(address[] memory things) public returns (bool) {
        for (uint256 i = 0; i < things.length; i++) {
            require(isThing(things[i]), "Must all be things");
            Thing(things[i]).increment();
        }
    }
}
