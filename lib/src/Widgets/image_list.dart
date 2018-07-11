import 'package:flutter/material.dart';
import '../Models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return imageListItem(images[index]);
      },
    );
  }

  Widget imageListItem(ImageModel image) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(image.url),
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          Text(image.title),
        ],
      ),
    );
  }
}
