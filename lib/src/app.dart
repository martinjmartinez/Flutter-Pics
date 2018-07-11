import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'Models/image_model.dart';
import 'dart:convert';
import 'Widgets/image_list.dart';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  bool isFetchingData = false;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    
    setState(() {
      isFetchingData = true;
    });

    final response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final imageModel = new ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lets see some images!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: isFetchingData ? null : fetchImage,
          child: Icon(Icons.add),
        ),
        body: ImageList(images),
      ),
    );
  }
}
