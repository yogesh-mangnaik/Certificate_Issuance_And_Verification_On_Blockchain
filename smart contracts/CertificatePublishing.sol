pragma solidity >=0.4.22 <0.6.0;

contract CertificatePublishing{
    
    mapping(uint256 => bytes32) public certificateRoots;
    
    event PublishStatus(bytes32 root, uint256 year);
    
    uint public x = 0;
    
    address owner;
    
    /*To be used to set accessiblity of function so that
    only the deployer of the contract can call it*/
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    constructor() public{
        owner = msg.sender;
    }
    
    function publish(bytes32 root, uint256 year) public onlyOwner {
        if(certificateRoots[year] == 0x0){
            certificateRoots[year] = root;
            emit PublishStatus(root, year);
            x = 1;
        }
        else{
            x = 2;
        }
    }
    
    function getRoot(uint256 year) public view returns(bytes32){
        return certificateRoots[year];
    }
}