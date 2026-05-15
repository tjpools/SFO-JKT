"""
Flight Tracking Application
Tracks flight itinerary with timezone conversions
"""

from datetime import datetime, timedelta
import pytz
from tabulate import tabulate


class Flight:
    """Represents a single flight segment"""

    def __init__(self, flight_number, origin, destination, 
                 departure_time, arrival_time, 
                 origin_tz, destination_tz, seats, duration):
        self.flight_number = flight_number
        self.origin = origin
        self.destination = destination
        self.departure_time = departure_time
        self.arrival_time = arrival_time
        self.origin_tz = pytz.timezone(origin_tz)
        self.destination_tz = pytz.timezone(destination_tz)
        self.seats = seats
        self.duration = duration

    def get_departure_local(self):
        """Get departure time in local timezone"""
        return self.departure_time.astimezone(self.origin_tz)

    def get_arrival_local(self):
        """Get arrival time in local timezone"""
        return self.arrival_time.astimezone(self.destination_tz)

    def get_departure_utc(self):
        """Get departure time in UTC"""
        return self.departure_time.astimezone(pytz.UTC)

    def get_arrival_utc(self):
        """Get arrival time in UTC"""
        return self.arrival_time.astimezone(pytz.UTC)

    def is_departed(self):
        """Check if flight has departed"""
        return datetime.now(pytz.UTC) >= self.get_departure_utc()

    def is_arrived(self):
        """Check if flight has arrived"""
        return datetime.now(pytz.UTC) >= self.get_arrival_utc()

    def get_status(self):
        """Get current flight status"""
        if self.is_arrived():
            return "✅ Arrived"
        elif self.is_departed():
            return "✈️ In Flight"
        else:
            return "⏳ Scheduled"

    def __str__(self):
        dep_local = self.get_departure_local()
        arr_local = self.get_arrival_local()
        return (f"{self.flight_number}: {self.origin} → {self.destination}\n"
                f"  Departure: {dep_local.strftime('%b %d, %I:%M %p %Z')}\n"
                f"  Arrival: {arr_local.strftime('%b %d, %I:%M %p %Z')}\n"
                f"  Duration: {self.duration}\n"
                f"  Seats: {self.seats}\n"
                f"  Status: {self.get_status()}")


class FlightItinerary:
    """Manages complete flight itinerary"""

    def __init__(self):
        self.flights = []

    def add_flight(self, flight):
        """Add a flight to the itinerary"""
        self.flights.append(flight)

    def get_layover(self, index):
        """Calculate layover between flights"""
        if index >= len(self.flights) - 1:
            return None

        arrival = self.flights[index].get_arrival_utc()
        departure = self.flights[index + 1].get_departure_utc()
        duration = departure - arrival

        hours = int(duration.total_seconds() // 3600)
        minutes = int((duration.total_seconds() % 3600) // 60)

        return {
            'location': self.flights[index].destination,
            'duration': f"{hours}h {minutes:02d}m",
            'arrival': self.flights[index].get_arrival_local(),
            'departure': self.flights[index + 1].get_departure_local()
        }

    def display_itinerary(self):
        """Display complete itinerary"""
        print("\n" + "="*80)
        print("✈️  FLIGHT ITINERARY".center(80))
        print("="*80 + "\n")

        for i, flight in enumerate(self.flights, 1):
            print(f"Flight {i}: {flight.flight_number}")
            print("-" * 80)
            print(flight)
            print()

            layover = self.get_layover(i - 1)
            if layover:
                print(f"🕐 Layover in {layover['location']}: {layover['duration']}")
                print(f"   Next departure: {layover['departure'].strftime('%b %d, %I:%M %p %Z')}")
                print()

    def display_summary_table(self):
        """Display itinerary as a summary table"""
        headers = ["Flight", "Route", "Departure", "Arrival", "Duration", "Seats", "Status"]
        rows = []

        for flight in self.flights:
            dep = flight.get_departure_local()
            arr = flight.get_arrival_local()
            rows.append([
                flight.flight_number,
                f"{flight.origin} → {flight.destination}",
                dep.strftime('%b %d, %I:%M %p %Z'),
                arr.strftime('%b %d, %I:%M %p %Z'),
                flight.duration,
                flight.seats,
                flight.get_status()
            ])

        print("\n" + tabulate(rows, headers=headers, tablefmt="grid"))

    def get_next_flight(self):
        """Get the next upcoming flight"""
        now = datetime.now(pytz.UTC)
        for flight in self.flights:
            if not flight.is_departed():
                return flight
        return None

    def display_next_flight(self):
        """Display information about next flight"""
        next_flight = self.get_next_flight()
        if next_flight:
            print("\n" + "="*80)
            print("🔔 NEXT FLIGHT".center(80))
            print("="*80 + "\n")
            print(next_flight)

            time_until = next_flight.get_departure_utc() - datetime.now(pytz.UTC)
            if time_until.total_seconds() > 0:
                days = time_until.days
                hours = int(time_until.seconds // 3600)
                minutes = int((time_until.seconds % 3600) // 60)
                print(f"\n⏰ Time until departure: {days}d {hours}h {minutes}m")
        else:
            print("\n✅ All flights completed!")


def create_itinerary():
    """Create the flight itinerary with the provided data"""
    itinerary = FlightItinerary()

    # Flight 1: ANA 107 (SFO → HND)
    # Departure: 01:40 AM PDT, July 2, 2024
    # Arrival: 04:25 AM JST, July 3, 2024
    flight1 = Flight(
        flight_number="ANA 107",
        origin="SFO",
        destination="HND",
        departure_time=datetime(2024, 7, 2, 8, 40, tzinfo=pytz.UTC),  # 17:40 UTC
        arrival_time=datetime(2024, 7, 2, 19, 25, tzinfo=pytz.UTC),    # 19:25 UTC
        origin_tz="America/Los_Angeles",
        destination_tz="Asia/Tokyo",
        seats="34A, 34C",
        duration="10h 45m"
    )
    itinerary.add_flight(flight1)

    # Flight 2: ANA 855 (HND → CGK)
    # Departure: 10:15 AM JST, July 3, 2024
    # Arrival: 16:00 PM WIB, July 3, 2024
    flight2 = Flight(
        flight_number="ANA 855",
        origin="HND",
        destination="CGK",
        departure_time=datetime(2024, 7, 3, 1, 15, tzinfo=pytz.UTC),   # 01:15 UTC
        arrival_time=datetime(2024, 7, 3, 9, 0, tzinfo=pytz.UTC),      # 09:00 UTC
        origin_tz="Asia/Tokyo",
        destination_tz="Asia/Jakarta",
        seats="21A, 21B",
        duration="7h 45m"
    )
    itinerary.add_flight(flight2)

    # Flight 3: ANA 856 (CGK → HND)
    # Departure: 21:25 PM WIB, July 19, 2024
    # Arrival: 06:50 AM JST, July 20, 2024
    flight3 = Flight(
        flight_number="ANA 856",
        origin="CGK",
        destination="HND",
        departure_time=datetime(2024, 7, 19, 14, 25, tzinfo=pytz.UTC), # 14:25 UTC
        arrival_time=datetime(2024, 7, 19, 21, 50, tzinfo=pytz.UTC),   # 21:50 UTC
        origin_tz="Asia/Jakarta",
        destination_tz="Asia/Tokyo",
        seats="21A, 21B",
        duration="7h 25m"
    )
    itinerary.add_flight(flight3)

    # Flight 4: ANA 108 (HND → SFO)
    # Departure: 22:55 PM JST, July 20, 2024
    # Arrival: 16:55 PM PDT, July 20, 2024
    flight4 = Flight(
        flight_number="ANA 108",
        origin="HND",
        destination="SFO",
        departure_time=datetime(2024, 7, 20, 13, 55, tzinfo=pytz.UTC), # 13:55 UTC
        arrival_time=datetime(2024, 7, 20, 23, 55, tzinfo=pytz.UTC),   # 23:55 UTC
        origin_tz="Asia/Tokyo",
        destination_tz="America/Los_Angeles",
        seats="32A, 32C",
        duration="11h 00m"
    )
    itinerary.add_flight(flight4)

    return itinerary


def main():
    """Main application entry point"""
    print("\n" + "🛫" * 40)
    print("FLIGHT TRACKER APPLICATION".center(80))
    print("🛬" * 40)

    itinerary = create_itinerary()

    # Display full itinerary
    itinerary.display_itinerary()

    # Display summary table
    itinerary.display_summary_table()

    # Display next flight
    itinerary.display_next_flight()

    print("\n" + "="*80 + "\n")


if __name__ == "__main__":
    main()
