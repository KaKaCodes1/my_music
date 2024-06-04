import 'package:flutter/material.dart';
import 'package:my_music/screens/home_screen.dart';
import 'package:my_music/screens/login_screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  int _selectedIndex= 1;
    //To be able to navigate back to home page using navbar
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index == 0){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage()
            )
          );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Account",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Image.asset(
                  'assets/images/listen.png',
                  height: 200,
                  width: 200,
                ),
                
                const SizedBox(
                  height: 10,
                ),
                
                const Text(
                  'Hello, Music Listener!',
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 32,
                    ),
                  ),
          
                  const SizedBox(
                  height: 5,
                  ),
          
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: const Text('Logging Out'),
                        content: const Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context), 
                            child: const Text('No')
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => Login(),
                                )
                                );
                              }, 
                              child: const Text('Yes')
                              ),
                        ],
                      );
                    }
                    );
                }, 
                child: const Text(
                  'Log out!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                  )
                ),
          
              
            ],
          ),
        ),
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