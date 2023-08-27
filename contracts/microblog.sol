// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.7;
import "./microtoken.sol";
import "./register.sol";
import "./resolver.sol";


contract MicroBlog is MicroToken {
 
    Registry public registry;
    SimpleResolver public defaultResolver;


    struct Blog{
        uint256 postId;
        address payable author;
        string content;
        uint256 timeStamp;
    }


    struct Follows{
        uint256 followId;
        bool isfollowing;
   }
    
    uint256 public nextPostId;
    uint256 public nextfollow;
    mapping (address => string) public userName;
    mapping(uint256 => Blog) public post;
    mapping (address => bool) public authorizedUser;
    uint256 public reward;
    mapping(address => bool) public following;
    Blog[] public blogPost;
    mapping(uint256 => Follows) public followmap;
    



    event PostCreated(uint256 postId, address author, string content, uint256 timeStamp);
    event follow(address follower, address following);
    event unfollow(address follower, address unfollowing);


    constructor(address ownerAddresss, uint256 _reward,address registryAddress, address resolverAddress) MicroToken("microtoken", "mt", 18, 10000000000000){
         nextPostId = 1;
         authorizedUser[ownerAddresss] = true;
         owner = ownerAddresss;
         reward = _reward;
         registry = Registry(registryAddress);
        defaultResolver = SimpleResolver(resolverAddress);
    }
    

    modifier OnlyauthorizedUser {
        require(authorizedUser[msg.sender], 'not an Authorized user');
        _;
        
    }

   function authorized(address userAddress, string memory username) public {
    require(bytes(username).length > 0, "Please enter a userName");
    userName[userAddress] = username;
    authorizedUser[userAddress] = true;
    setUsername(username,userAddress);
    registerENSUsername(userAddress, username);
    }


function createBlogPost(string memory content, address payable author)  public  OnlyauthorizedUser {
    require(bytes(content).length > 0, 'Post must contain something');
    require(balanceOf(owner) >= reward, "Insufficient contract balance for reward");
    transfer(author,reward);
    post[nextPostId] = Blog(nextPostId, author, content, block.timestamp);
    blogPost.push(post[nextPostId]);
    emit PostCreated(nextPostId, author, content, block.timestamp);
    nextPostId++;

}


 function registerENSUsername(address userAddress, string memory username) internal {
        require(bytes(username).length > 0, "Please enter a username");
        bytes32 node = keccak256(abi.encodePacked(username));
        registry.setOwner(node, userAddress);
        registry.setResolver(node, address(defaultResolver));
    }

    function setUsername(string memory username, address userAddress) internal {
        require(bytes(username).length > 0, "Please enter a username");
        bytes32 node = keccak256(abi.encodePacked(username));
 
        registry.setOwner(node, userAddress);
        registry.setResolver(node, address(defaultResolver));
    }


    function followuser(address followers)public OnlyauthorizedUser{
        require(followers != address(0),'this is not an account');
        require(msg.sender == followers, "you can't follow yourself");
        Follows memory followss = followmap[nextfollow];
        followss.isfollowing= true;
         following[followers] = true;
        emit follow(msg.sender, followers);

        nextfollow++;



    }

    
    function unfollowuser(address followers)public OnlyauthorizedUser{
        require(followers != address(0),'this is not an account');
        require(msg.sender == followers, "you can't unfollow yourself");
        require(following[followers] = true, 'you need to follow this user before you can unfollow');
        require(following[msg.sender],'you are not following anyone');
        following[followers] = false;
        emit unfollow(msg.sender, followers);

        nextfollow--;
    }


  function update(string memory content, uint256 postId) public returns(bool){
      for (uint i = 0; i < nextPostId; i++) {
        if(postId == post[i].postId){
            post[i].content = content;
            post[i].timeStamp = block.timestamp;
            
            return true;
        }
    }
      return false;
  }

  function deletePost(uint256 id)public returns(bool){
    for (uint i = 0; i < nextPostId; i++) {
        if (id == post[i].postId) {
            delete blogPost[id];
            nextPostId--;
            return true;
        }
    }
    return false;
  }


  function getpost(uint256  postId)public OnlyauthorizedUser  returns (uint256, string memory,address,uint256){
  require(authorizedUser[msg.sender] = true,'This user is not authorized');
  Blog memory blog = blogPost[postId];
  require(following[blog.author]  = true,"You're not following this user");
  return (blog.postId,blog.content,blog.author,blog.timeStamp);
 }


   
  function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}
