// SPDX-License-Identifier: MIT
pragma solidity >=0.4.23;

//solhint-disable max-line-length
//solhint-disable no-inline-assembly

contract Thing {
    string public name;
    uint256 public value;

    event ThingEvent(address sender, string name, uint256 value);

    constructor() {
        name = "master"; // force default deployment to be init'd
    }

    function init(string memory _name, uint256 _value) public {
        require(bytes(name).length == 0); // ensure not init'd already.
        require(bytes(_name).length > 0);

        name = _name;
        value = _value;
    }

    function doit() public {
        emit ThingEvent(address(this), name, value);
    }

    function epicfail() public returns (string memory) {
        value++;
        require(false, "Hello world!");
        return "Goodbye sweet world!";
    }

    function increment() public {
        value++;
    }
}
