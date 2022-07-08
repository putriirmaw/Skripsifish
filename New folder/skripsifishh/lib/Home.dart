import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:skripsifishh/Camera.dart';

void main() => runApp(MaterialApp(
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late File pickedImage;
  bool isImageloaded = false;

  getImageFromGallery() async {
    var tempStore = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      pickedImage = File(tempStore!.path);
      isImageloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size srz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('TFLite Demo'),
      ),
      body: Stack(
        children: [
        SingleChildScrollView(

          child: Container(
            child: Column(
              children: [
                SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      isImageloaded
                          ? Center(
                        child: Container(
                          height: 350,
                          width: 350,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(File(pickedImage.path)),
                                  fit: BoxFit.contain)),
                        ),
                      )
                          : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: srz.height * 0.3,
                            width: 300,
                            color: Colors.red,
                            child: Text(
                              "Gambar tidak ada",
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                            height: srz.height * 0.3,
                            width: 300,
                            color: Colors.yellow,
                            child: Text(
                              "Deskripsi",
                            )),
                      ),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          // height: 50,
          alignment: Alignment.bottomCenter,

          child: Container(
            padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
            color: Colors.pink,
            width: srz.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // IconButton(
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => CameraPage()),
                //       );
                //     },
                //     icon: Icon(Icons.camera),
                //     iconSize: 40),
                IconButton(
                    onPressed: () {
                      getImageFromGallery();
                    },
                    icon: Icon(Icons.album),
                    iconSize: 40),
              ],
            ),
          ),
        )
      ],)

    );
  }
}
