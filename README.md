---
# MicroBlog: Bridging Social Media and DeFi

MicroBlog is a decentralized social media platform that combines the power of blockchain technology with microblogging, enabling users to share thoughts, engage with content, and earn rewards seamlessly. 
This project integrates a custom ERC-20 token, Ethereum Name Service (ENS) integration for username mapping, and a novel approach to user engagement and monetization.

## Features

- **Seamless Integration with MicroToken:** MicroBlog is built on top of the MicroToken ERC-20 token, enabling seamless rewards and payments within the platform.
- **ENS Integration:** Users can claim and link ENS domain names to their accounts, making it easier for others to discover and interact with their content.
- **Microblogging:** Users can create short posts containing their thoughts, updates, or anything they'd like to share with their followers.
- **User Engagement:** Follow users, like and comment on posts, and build your own network within the platform.
- **Monetization:** Earn tokens through various actions, including posting valuable content, receiving likes and comments, and more.
- **Personalization:** Customize your profile and account settings to reflect your personality and interests.

## Deployed to 
1. Avalanche (Fuji C-chain):
 - Microblog contract address - 0x62891c46C5A874452fB235108bc7282D31272c6E
 - Registry contract address - 0x8567B9196155798E4E9C90c3914191e4E41a6948
 - Resolver contract address - 0x418dc642FB7E6c018e31e38973a1308A47Ecea08

2. Arbitrum
   - Microblog contract address - 0xCC9f0DAfAbcD64e1e8f38f9a204327dd96fC2DE9
   - Registry contract address - 0x215d9b1D167199C42835cA1dF4B18CE526235922
   - Resolver contract address - 0x937E8D3E0112847755DD614d00AC41e3bbC34422 

## Getting Started

To get started with MicroBlog, follow these steps:

1. **Installation:** Clone this repository to your local environment.

2. **Smart Contracts:**
   - Deploy the `MicroToken` ERC-20 token contract.
   - Deploy the `Registry` and `Resolver` contracts for ENS integration.
   - Deploy the `MicroBlog` contract, ensuring correct addresses for the token contract, Registry, and Resolver.

3. **Configuration:** Update the contract addresses in the `MicroBlog` contract constructor with the addresses of the deployed contracts.

4. **Username Setup:**
   - Call the `authorized` function to authorize a user and set their username.
   - The username will be used for ENS registration and mapping.

5. **Creating Content:** Users can now create posts, follow other users, and engage with the platform.

## Contributing

Contributions to the MicroBlog project are welcome! If you'd like to contribute, follow these steps:

1. Fork this repository and create a new branch for your feature or bug fix.

2. Make your changes and ensure that the code passes all tests.

3. Submit a pull request, providing a clear description of the changes you've made.

## License

This project is licensed under the [UNLICENSED License](https://unlicense.org/), which means you have the freedom to use, modify, and distribute the code without any restrictions.

## Contact

For any inquiries or feedback, feel free to contact us at [ucheokenyidm@gmail.com]

---
