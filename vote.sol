//0xe1522696Ecb02Df8054e9439f49Cc0106FE9e0dB

pragma solidity^0.8.1;
contract Voting {
    mapping (bytes32 => uint256) public votesReceived;
    bytes32[] public candidateList;

  constructor(bytes32[] memory candidateNames) public
  {
    candidateList = candidateNames;
  }

  function getVotesForCandidate(bytes32 candidate) view public returns (uint256)
  {
    require(validCandidate(candidate));
    return votesReceived[candidate];
  }

  function voteForCandidate(bytes32 candidate) public
  {
    require(validCandidate(candidate));
    votesReceived[candidate] += 1;
  }

  function validCandidate(bytes32 candidate) view public returns (bool) {
    for(uint i = 0; i < candidateList.length; i++) {
      if (candidateList[i] == candidate) {
        return true;
      }
    }
    return false;
  }
}
