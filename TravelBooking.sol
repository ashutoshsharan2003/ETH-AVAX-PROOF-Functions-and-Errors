// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TravelBooking {

  // Define an enum for different travel destinations
  enum Destination { Paris, Tokyo, NewYork, Sydney }

  // Structure to store travel booking details
  struct Booking {
    address traveler;
    Destination destination;
    uint travelDate; // Unix timestamp
    uint numTickets;
    bool isConfirmed;
  }

  // Mapping for storing bookings with unique identifiers
  mapping(uint => Booking) public bookings;
  uint public nextBookingId = 1; // Keeps track of next booking ID

  // Function to create a new travel booking
  function createBooking(address _traveler, Destination _destination, uint _travelDate, uint _numTickets) public {
    Booking memory newBooking = Booking(_traveler, _destination, _travelDate, _numTickets, false);
    bookings[nextBookingId] = newBooking;
    nextBookingId++;
  }

  // Function to confirm a booking (simulates approval process)
  function confirmBooking(uint _bookingId) public {
    require(bookings[_bookingId].isConfirmed == false, "Booking already confirmed");
    bookings[_bookingId].isConfirmed = true;
  }

  // Function to view booking details (traveler can see their bookings)
  function viewBooking(uint _bookingId) public view returns (Booking memory) {
    require(bookings[_bookingId].traveler == msg.sender, "Unauthorized to view booking");
    return bookings[_bookingId];
  }

  /*
    few addresses for testing purpose:
   
       0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    */
}
