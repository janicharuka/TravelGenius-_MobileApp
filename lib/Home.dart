import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TravelGenius', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Stack( // Using Stack to position elements on top of each other
        children: [
          ListView(
            children: [
              // Hero Section with Gradient and Animation
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/hero.jpg'),
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
                        fontFamily: 'Poppins', // Advanced font
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Discover amazing destinations.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 248, 182, 182),
                        fontSize: 18,
                        fontFamily: 'Roboto', // Advanced font
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    AnimatedButton(
                      text: 'Join Now',
                      backgroundColor: Colors.deepOrange,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),
                    SizedBox(height: 10),
                    // Register button will now be positioned in the upper-right corner
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
              ),
            ],
          ),
          Positioned(
            top: 2.0, // Distance from the top of the screen
            right: 2.0, // Distance from the right side of the screen
            child: AnimatedButton(
              text: 'Register',
              backgroundColor: Color.fromARGB(0, 229, 233, 240),
              onPressed: () {
                Navigator.of(context).pushNamed('/Reg');
              },
            ),
          ),
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
          fontFamily: 'Poppins', // Advanced font
        ),
      ),
    );
  }
}

// Grids and Card Widgets
// Destination Grid
class DestinationGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DestinationCard(
          image: 'assets/images/destination-1.jpg',
          title: 'Sigiriya',
          description: 'An ancient rock fortress in Sri Lanka.',
        ),
        DestinationCard(
          image: 'assets/images/destination-2.jpg',
          title: 'Horton Plains',
          description: 'A UNESCO World Heritage Site.',
        ),
        DestinationCard(
          image: 'assets/images/destination-3.jpg',
          title: 'Nine Arch Bridge',
          description: 'A scenic stone bridge in Ella.',
        ),
      ],
    );
  }
}

// Hotel Grid
class HotelGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DestinationCard(
          image: 'assets/images/hotel-1.jpg',
          title: 'Sunset Beach Hotel',
          description: 'Located in Mirissa with a private beach.',
        ),
        DestinationCard(
          image: 'assets/images/hotel-2.jpg',
          title: 'Ella Jungle Resort',
          description: 'Surrounded by wild jungles.',
        ),
        DestinationCard(
          image: 'assets/images/hotel-3.jpg',
          title: 'Avani Bentota Resort',
          description: 'A relaxing resort with water sports.',
        ),
      ],
    );
  }
}

// Activity Grid
class ActivityGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DestinationCard(
          image: 'assets/images/activity-1.jpg',
          title: 'Hiking Trails',
          description: 'Explore scenic trails in Sri Lanka.',
        ),
        DestinationCard(
          image: 'assets/images/activity-2.jpg',
          title: 'Whale Watching',
          description: 'Set sail for an unforgettable experience.',
        ),
        DestinationCard(
          image: 'assets/images/activity-3.jpg',
          title: 'Diving',
          description: 'Discover marine wonders.',
        ),
      ],
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins', // Advanced font
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

// Animated Button Widget
class AnimatedButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

  AnimatedButton({required this.text, required this.backgroundColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins', // Advanced font
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
