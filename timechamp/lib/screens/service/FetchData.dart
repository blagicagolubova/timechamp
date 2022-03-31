import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:timechamp/models/album.dart';

class FetchDataPage extends StatelessWidget {
  static const routeName = '/fetchData';


  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }


  @override
  Widget build(BuildContext context) {
    var futureAlbum = fetchAlbum();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [Text('Title:',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text(snapshot.data!.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text('User Id:',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                    Text(snapshot.data!.userId.toString(),style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
    );
  }
}


