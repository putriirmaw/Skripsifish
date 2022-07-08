import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  File? image;
  bool isImageloaded = false;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
        isImageloaded = true;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() {
        this.image = imageTemp;
        isImageloaded = true;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size srz = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TAEK'),),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
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
                                          image: FileImage(File(image!.path)),
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
                              // height: 500,
                              width: 300,
                              color: Colors.yellow,
                              child: Text(
                                "sjadk dsajdskjad ldshflksjdf  sdiobdslkhf dhfds idshflhs ifhdsoigf hfisdh ifihdsi dsfhdif "
                                "dlsghlkds kdkbfisd sdfhsdli fdsihfiosd idshsoid ihfdsoigfda igadsiocgsa  sadis oaoici b",
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Container(
        //   // height: 50,
        //   alignment: Alignment.bottomCenter,
        //
        //   child: Container(
        //     padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
        //     color: Colors.pink,
        //     width: srz.width,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.end,
        //       children: [
        //         IconButton(
        //             onPressed: () {
        //               pickImageC();
        //             },
        //             icon: Icon(Icons.camera),
        //             iconSize: 40),
        //         IconButton(
        //             onPressed: () {
        //               pickImage();
        //             },
        //             icon: Icon(Icons.album),
        //             iconSize: 40),
        //       ],
        //     ),
        //   ),
        // ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  pickImageC();
                },
                icon: Icon(Icons.camera)),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                pickImage();
              },
              icon: Icon(Icons.photo),
            ),
            label: 'Gallery',
          ),
        ],
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
      ),
    );
  }
}
