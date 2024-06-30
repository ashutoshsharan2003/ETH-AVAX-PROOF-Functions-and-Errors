# TRAVEL BOOKING 

This Solidity program is a simple demo code for error handling. The purpose of the program is to demonstrate the error handling while creation and updation of passport and application for visa using require(), assert() and revert().

## Description

The `TravelBooking` contract is a Solidity smart contract designed to make it easier to create and manage travel reservations on the Ethereum network. It has the following features: <>>Destinations: A list that names four locations: Sydney, Paris, Tokyo, and New York.
>>Booking data: A struct containing the traveler's address, destination of choice, date of travel (as a Unix timestamp), quantity of tickets purchased, and the status of the confirmation is used to record booking data.
>>Storage: A mapping to keep track of reservations, each with an own booking ID.
>>Unique Booking ID: A counter ({nextBookingId}) that gives each booking a unique ID.
>>Create Booking: This feature enables users to add new reservations by entering the traveler's information, destination, date of departure, and number of tickets. Initial reservations are unverified.
>>Confirm Booking: This feature allows reservations to be verified, guaranteeing that they can never be verified again.
>>View Booking: This feature lets passengers see the specifics of their own reservations, and it includes authorization checks to make sure that only the right travelers may access their reservations.

This agreement guarantees a transparent and safe manner to handle reservations for travel, complete with explicit authorization and confirmation procedures.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., TravelBokking.sol). Copy and paste the following code into the file:

```js solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TravelBooking {

  // Define an enum for different travel destinations
  enum Destination { Delhi, Mumbai, Banglore, Pune }

  // Structure to store travel booking details
  struct Booking {
    address traveler;
    Destination destination;
    uint numTickets;
    bool isConfirmed;
  }

  // Mapping for storing bookings with unique identifiers
  mapping(uint => Booking) public bookings;
  uint public nextBookingId = 3; // Keeps track of next booking ID

  // Function to create a new travel booking
  function createBooking(address _traveler, Destination _destination, uint _numTickets) public {
    require(_numTickets > 0, "Number of tickets must be greater than zero");
  

    Booking memory newBooking = Booking(_traveler, _destination,  _numTickets, false);
    bookings[nextBookingId] = newBooking;
    nextBookingId++;
  }

  // Function to confirm a booking (simulates approval process)
  function confirmBooking(uint _bookingId) public {
    require(bookings[_bookingId].traveler == msg.sender, "Only the traveler can confirm their booking");
    require(bookings[_bookingId].isConfirmed == false, "Booking already confirmed");
 

    bookings[_bookingId].isConfirmed = true;
  }

  // Function to view booking details (traveler can see their bookings)
  function viewBooking(uint _bookingId) public view returns (Booking memory) {
    require(bookings[_bookingId].traveler == msg.sender, "Unauthorized to view booking");
    return bookings[_bookingId];
  }

  // Function to cancel a booking before it is confirmed
  function cancelBooking(uint _bookingId) public {
    require(bookings[_bookingId].traveler == msg.sender, "Only the traveler can cancel their booking");
    require(bookings[_bookingId].isConfirmed == false, "Cannot cancel a confirmed booking");
 

    delete bookings[_bookingId];
  }
}

```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.7" (or another compatible version), and then click on the "Compile TravelBooking.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "TravelBooking" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it. The `TravelBooking` Solidity contract enables users to manage travel bookings on the Ethereum blockchain. It supports destinations (Paris, Tokyo, New York, Sydney) and stores booking details (traveler, destination, travel date, ticket count, confirmation status) in a mapping identified by unique booking IDs. Users can create bookings, which initially have an unconfirmed status, and confirm bookings later. Travelers can view their own booking details, ensuring privacy. The contract maintains a counter for the next booking ID, ensuring each booking is uniquely identified. The system includes functions to create, confirm, and view bookings with authorization checks for security.

#### Author
Ashutosh Sharan 
(https://www.linkedin.com/in/ashutosh-sharan-177630249/)

#### License
This TravelBooking is licensed under the MIT License
