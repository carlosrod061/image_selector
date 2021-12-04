import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imagePath = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Image Picker"),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Imagen Cargada',
                    style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                  (imagePath == "") ? Container() : Image.file(File(imagePath)),
                  ElevatedButton(
                      child: Text("Tomar Foto"),
                      onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        XFile _pickedFile = (await _picker.pickImage(
                            source: ImageSource.camera)) as XFile;
                        imagePath = _pickedFile.path;
                        setState(() {});
                      })
                ],
              ),
            )));
  }
}
