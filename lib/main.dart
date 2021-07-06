/// Flutter code sample for InteractiveViewer

// This example shows a simple Container that can be panned and zoomed.

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key? key}) : super(key: key);

  final List<String> imageList = [
    "assets/grapefruit-slice-332-332.jpg",
    "assets/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery'
        ),
      ),
      body:
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) {
                        return ImageFull(url: imageList[index],);
                  })
                );
              },
              child: Hero (
                tag: imageList[index],
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        imageList[index],
                      ),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}

class ImageFull extends StatelessWidget {
  final String url;
  const ImageFull({Key? key,this.url = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ClipRect(
          child: InteractiveViewer(
            minScale: 0.1,
            maxScale: 2.5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                  child: Image.asset(
                    url,
                  ),
                  fit: BoxFit.fitWidth
                ),
              ),
            ),
          ),
        ),
    );
  }
}
