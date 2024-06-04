import 'package:flutter/material.dart';
import 'package:my_music/model/album.dart';
import 'package:my_music/screens/account_screen.dart';
import 'package:my_music/screens/album_details_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  // Creating the list of albums
  final List<Album> albums = [
    Album(
      title: "VOLCANO",
      artist: 'Jungle',
      imagePath: 'assets/images/JUNGLE.jpg',
      songs: [
        "Back to 74",
        "I've Been In love",
        "Candle Flame",
        "Pretty Little Thing"
      ],
    ),
    Album(
      title: "My Beautiful Dark Twisted Fantasy",
      artist: "Kanye West",
      imagePath: "assets/images/kanye-my-beautiful-dark-twisted-fantasy.jpg",
      songs: [
        "Monster",
        "Lost In The World",
        "POWER",
        "All Of The Lights",
        "Runaway"
      ],
    ),
    Album(
      title: "SOS",
      artist: "SZA",
      imagePath: "assets/images/sos.png",
      songs: [
        "Snooze",
        "Smoking On My Ex Pack",
        "Nobody Gets Me",
        "Good Days",
        "I Hate U"
      ],
    ),
    Album(
      title: "CTRL",
      artist: "SZA",
      imagePath: "assets/images/ctrl.png",
      songs: [
        "The Weekend",
        "Miles",
        "Waves",
        "Broken Clocks",
        "Love Galore"
      ],
    ),
  ];
  //for navigation to account
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyAccount())
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Music",
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.black,
      body: ListView.builder( // Display albums using ListView.builder
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];  // Get current album
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: SizedBox(
              width: double.infinity, // Use screen width
              height: 80.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 181, 181, 181),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(
                      album.imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    album.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    album.artist,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    try {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumDetailsScreen(album: album),
                        ),
                      );
                    } catch (e) {
                      debugPrint('$e');
                      // Handle the exception by showing a snackbar or logging the error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
      
      //bottom navbar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            ),  
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 77, 149, 208),
        onTap:_onItemTapped,
          
        
        ),
    );
  }
}


  
 