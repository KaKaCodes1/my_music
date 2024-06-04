import 'package:flutter/material.dart';
import 'package:my_music/model/album.dart';

class AlbumDetailsScreen extends StatelessWidget {
  final Album album;

  // ignore: use_super_parameters
  const AlbumDetailsScreen({Key? key, required this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //debugPrint("Received album title: ${album.title}");
    return Scaffold(
        appBar: AppBar(
        title: Text(album.title, style: const TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                Image.asset(
                  album.imagePath,
                  width: 100,
                  height: 100,
                ),
            
                const SizedBox(//creating a space
                  height: 5,
                ),
            
                Text(
                  album.title,
                  style: const TextStyle(color: Colors.white),
                ),
            
                const SizedBox(//creating a space
                  height: 2,
                ),
            
                Text(
                  album.artist,
                  style: const TextStyle(color: Colors.white),
                ),
            
                const SizedBox(//creating a space
                  height: 2,
                ),
              ],
            ),
        

        Expanded(
            child: ListView.builder(
              itemCount: album.songs.length,
              itemBuilder: (context, index){
              return ListTile(
                title: Text(
                  album.songs[index],
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  album.artist, // Assuming all songs have the same artist
                  style: const TextStyle(color: Colors.white),
                ),
              );
              }
              ),
          )
          

          ],
        
        
        ),
    )
    );
  }
}