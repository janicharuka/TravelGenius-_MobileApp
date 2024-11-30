import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelGenius'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          // Hero Section
          Container(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/hero.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to TravelGenius',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Discover amazing destinations.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text('Join Now'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Popular Destinations Section
          SectionTitle(title: 'Popular Destinations'),
          DestinationGrid(),

          // Featured Hotels Section
          SectionTitle(title: 'Featured Hotels'),
          HotelGrid(),

          // Featured Activities Section
          SectionTitle(title: 'Featured Activities'),
          ActivityGrid(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Contact',
          ),
        ],
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
  }
}

// Destinations Grid
class DestinationGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 0.8,
        children: [
          DestinationCard(
            image: 'assets/destination-1.jpg',
            title: 'Sigiriya',
            description: 'An ancient rock fortress in Sri Lanka.',
          ),
          DestinationCard(
            image: 'assets/destination-2.jpg',
            title: 'Horton Plains',
            description: 'A UNESCO World Heritage Site.',
          ),
          DestinationCard(
            image: 'assets/destination-3.jpg',
            title: 'Nine Arch Bridge',
            description: 'A scenic stone bridge in Ella.',
          ),
        ],
      ),
    );
  }
}

// Hotels Grid
class HotelGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 0.8,
        children: [
          DestinationCard(
            image: 'assets/hotel-1.jpg',
            title: 'Sunset Beach Hotel',
            description: 'Located in Mirissa with a private beach.',
          ),
          DestinationCard(
            image: 'assets/hotel-2.jpg',
            title: 'Ella Jungle Resort',
            description: 'Surrounded by wild jungles.',
          ),
          DestinationCard(
            image: 'assets/hotel-3.jpg',
            title: 'Avani Bentota Resort',
            description: 'A relaxing resort with water sports.',
          ),
        ],
      ),
    );
  }
}

// Activities Grid
class ActivityGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        childAspectRatio: 0.8,
        children: [
          DestinationCard(
            image: 'assets/activity-1.jpg',
            title: 'Hiking Trails',
            description: 'Explore scenic trails in Sri Lanka.',
          ),
          DestinationCard(
            image: 'assets/activity-2.jpg',
            title: 'Whale Watching',
            description: 'Set sail for an unforgettable experience.',
          ),
          DestinationCard(
            image: 'assets/activity-3.jpg',
            title: 'Diving',
            description: 'Discover marine wonders.',
          ),
        ],
      ),
    );
  }
}

// Destination Card Widget
class DestinationCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  DestinationCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
