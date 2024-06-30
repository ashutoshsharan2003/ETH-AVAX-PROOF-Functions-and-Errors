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
