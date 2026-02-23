// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

// contract 생성
contract MintAnimalToken is ERC721Enumerable {
  // 컨트랙트가 빌드될 때 한 번 실행됨 ERC721(name, symbol)
  constructor() ERC721("h662Animals", "HAS") {} 

  mapping(uint256 => uint256) public animalTypes;

  function mintAnimalToken() public {
    // totalSupply -> 지금까지 민팅된 NFT 양
    uint256 animalTokenId = totalSupply() + 1; 

    // random 값 뽑아내기
    uint256 animalType = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, animalTokenId))) % 5 + 1;

    animalTypes[animalTokenId] = animalType;

    // ERC721에서 제공하는 minting 함수
    // msg.sender: 이 명령어를 실행한(minting 누른) 사람
    // animalTokenId: 갖고 있는 NFT를 증명하는 토큰이 됨
    _mint(msg.sender, animalTokenId); 
  }
}