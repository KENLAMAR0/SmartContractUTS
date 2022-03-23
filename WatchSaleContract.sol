//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract WatchSaleContract {

    receive() external payable{}
    fallback() external payable{}

    address payable private seller;
    string private buyer;
    uint private watchPrice;
    mapping(address => uint) balances;

    struct Watch {
       string brand;
       string model;
       uint serialnum;
       string condition;
    }

     Watch watchstock1 = Watch("Rolex", "Datejust", 16023, "Mint");
     Watch watchstock2 = Watch("Patek", "Nautilus", 5711, "Mint");
     Watch watchstock3 = Watch("Audemars Piguet", "Royal Oak", 14500, "Mint");

    modifier sellerOnly(){
        require(msg.sender == seller, "Akses khusus penjual jam");
        _;
        }

    constructor(){
        seller = payable(msg.sender);
    }

    function getSellerAdress() public view returns (address){
        return seller;
    }

    function getSellerBalance() public sellerOnly view returns(uint256){
        return seller.balance;
    }
    
    function setBuyerName(string memory watchBuyer) public sellerOnly{
        buyer = watchBuyer;
    } 

     function setWatchPrice(uint price) public sellerOnly{
        watchPrice = price;
    } 

    function getWatchPrice() view public returns (uint){
        return watchPrice;
    }

    function getBuyerName() view public returns (string memory){
        return buyer;
    }

    function payWatch1Price() external payable {
        require(msg.value == watchPrice, "Payment not according to price"); {
        }
    }

    function balanceOf() external view returns (uint){
        return address(this).balance;
    }

    function getWatch1Info() external view returns (Watch memory){
        return watchstock1;
    }

}
