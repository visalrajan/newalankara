import 'dart:io';

import 'package:alankara/screens/added_items.dart';
import 'package:camera/camera.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class DisplayImage extends StatefulWidget {

  @override
  State<DisplayImage> createState() => _DisplayImageState();
}

class _DisplayImageState extends State<DisplayImage> {

  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller;
  XFile? imageFile;

  List imageArray = [];
  // String? imageUrl;



  @override
  initState() {
    super.initState();
    initialSetup();
  }

  initialSetup() async {
    cameras = await availableCameras();
    controller = CameraController(
      cameras![0],
      ResolutionPreset.max,
    );
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("access error = ${e.toString()}");
            // Handle access errors here.
            break;
          default:
            print("default = ${e.toString()}");
            // Handle other errors here.
            break;
        }
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [

              if (controller?.value.isInitialized == true)
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  child: CameraPreview(controller!),
                ),
              Positioned(
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: IconButton(
                    onPressed: () async{

                      imageFile =
                      await controller?.takePicture();
                      imageArray.add(imageFile);
                      setState(() {
                        imageArray;
                      });


                    },
                    icon: Icon(Icons.camera, size: 45, color: Colors.white,),
                  )),
              Positioned(
                bottom: 5,
                right: 5,
                child: IconButton(
                    onPressed: () async{
                      // Navigator.pop(context, imageArray);
                      // var result =   await Navigator.push(
                      //        context,
                      //        MaterialPageRoute(
                      //            builder: (BuildContext context) => HomePage(
                      //                response: imageArray,)));
                      // imageArray=result;

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => AddedItems(response: imageArray, )));


                    },
                    icon: Icon(FontAwesomeIcons.check, size: 40, color: Colors.white,)),
              ),


            ],
          ),
          Container(
            height: 70,
            width: double.infinity,

            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: imageArray.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 50,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(imageArray[index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
