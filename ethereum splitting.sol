pragma solidity^0.5.17;

contract ethsplitter {
    function split(address payable user1, address payable user2) external payable {
        require(msg.value % 2 == 0 && msg.value !=0, "value must be even and non-zero");
        uint splitvalue = msg.value / 2;
        user1.transfer(splitvalue);
        user2.transfer(splitvalue);
    }
}