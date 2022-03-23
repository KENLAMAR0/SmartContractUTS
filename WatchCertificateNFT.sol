//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract WatchCertificateNFT is ERC1155 {

    uint256 public constant ROLEX_DATEJUST = 0;
    uint256 public constant PATEK_NAUTILUS = 1;
    uint256 public constant AP_ROYALOAK = 2;

    constructor() public ERC1155("https://ipfs.io/ipfs/Qmaagf81ib73w5qbCKjwNgccLU67zQDynGDLkvzbT85CmK?filename=RolexAuthCertificate.json"){
        _mint(msg.sender, ROLEX_DATEJUST, 2, "");
        _mint(msg.sender, PATEK_NAUTILUS, 2, "");
        _mint(msg.sender, AP_ROYALOAK,2, "");
    }

}
