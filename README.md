# crisis-aid-chain

## Description

This project implements a blockchain-based system for ensuring transparency and accountability in food donations. By leveraging the power of blockchain technology, specifically using Clarity smart contracts on the Stacks blockchain, we provide a robust solution for tracking food donations from the point of donation to distribution.

## Features

1. **Verification of Donations:** Each food donation transaction is logged on the blockchain, creating an immutable record.
2. **Secure Transactions:** The smart contract ensures that food donations are processed only after receiving the required safety and quality certifications.
3. **Auditing:** An auditing mechanism allows anyone to check the flow of food from the donor to the recipient in real-time.

## Smart Contract Functions

The Food Donation Transparency smart contract provides the following main functions:

- `register-donation`: Registers a new food donation with the donor, recipient, and amount.
- `certify-donation`: Certifies a food donation after safety and quality checks.
- `distribute-donation`: Marks a certified donation as distributed to the recipient.
- `get-donation`: Retrieves the details of a specific donation.
- `get-donation-count`: Returns the total number of donations registered.
- `audit-donation`: Provides the certification and distribution status of a donation for auditing purposes.

## Getting Started

### Prerequisites

- Stacks wallet (e.g., Hiro Wallet)
- Stacks blockchain account

### Interacting with the Smart Contract

1. Deploy the smart contract to the Stacks blockchain.
2. Use a Stacks wallet or development tools to interact with the contract functions.

## Usage

1. **Registering a Donation:**
   The contract owner can register a new donation using the `register-donation` function, specifying the recipient and the amount of food donated.

2. **Certifying a Donation:**
   After safety and quality checks, the contract owner can certify a donation using the `certify-donation` function.

3. **Distributing a Donation:**
   Once certified, the recipient can mark the donation as distributed using the `distribute-donation` function.

4. **Auditing:**
   Anyone can audit the status of a donation using the `audit-donation` function, which returns the certification and distribution status.

## Development

To contribute to the Food Donation Transparency project:

1. Clone the repository
2. Set up a Clarity development environment
3. Make your changes or additions to the smart contract
4. Test thoroughly using Clarity testing frameworks
5. Submit a pull request with your changes

## Future Enhancements

- Integration with IoT devices for real-time tracking of food shipments
- Implementation of a rating system for donors and recipients
- Expansion to include multiple types of donations (e.g., monetary, equipment)
- Development of a user-friendly frontend for easier interaction with the smart contract

## License

[MIT License](LICENSE)

## Contact

For questions or support, please open an issue in the GitHub repository or contact the development team at [email@example.com](mailto:email@example.com).

## Acknowledgments

- Stacks blockchain community
- Food donation organizations and partners
- All contributors and supporters of the Food Donation Transparency project
