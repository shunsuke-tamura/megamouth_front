import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megamouth_front/main.dart';
import 'package:megamouth_front/widget/take_picture.dart';

class ImageUpload extends ConsumerStatefulWidget {
  const ImageUpload({super.key});

  @override
  ImageUploadState createState() => ImageUploadState();
}

class ImageUploadState extends ConsumerState {
  late String imagePath1;
  late String imagePath2;
  late String imagePath3;

  @override
  void initState() {
    super.initState();
    imagePath1 = '';
    imagePath2 = '';
    imagePath3 = '';
  }

  Widget takePictureButton(int number) {
    return ElevatedButton(
      onPressed: () async {
        final path = await showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) => const TakePicture(),
        );
        if (path == null) return;
        switch (number) {
          case 1:
            imagePath1 = path;
            break;
          case 2:
            imagePath2 = path;
            break;
          case 3:
            imagePath3 = path;
            break;
          default:
            break;
        }
        setState(() {});
        logger.d(imagePath1);
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.indigo),
      child: const Icon(Icons.camera_alt_outlined),
    );
  }

  Widget picture(int number) {
    String path = '';
    switch (number) {
      case 1:
        path = imagePath1;
        break;
      case 2:
        path = imagePath2;
        break;
      case 3:
        path = imagePath3;
        break;
      default:
        break;
    }
    if (path == '') return takePictureButton(number);
    return Stack(alignment: Alignment.center, children: [
      Image.file(File(path)),
      Align(
        alignment: const Alignment(-1.6, -1.4),
        child: ElevatedButton(
          onPressed: () {
            if (number == 1) {
              imagePath1 = '';
            } else if (number == 2) {
              imagePath2 = '';
            } else if (number == 3) {
              imagePath3 = '';
            } else {
              return;
            }
            setState(() {});
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: const CircleBorder(),
            shadowColor: Colors.transparent,
          ),
          child: const Icon(Icons.close),
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //こちらを追加
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('写真撮影'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: imagePath1 != ''
                            ? BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : null,
                        margin: const EdgeInsets.all(20),
                        child: imagePath1 == ''
                            ? takePictureButton(1)
                            : picture(1),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: imagePath2 != ''
                            ? BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : null,
                        margin: const EdgeInsets.all(20),
                        child: imagePath2 == ''
                            ? takePictureButton(2)
                            : picture(2),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: imagePath3 != ''
                            ? BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              )
                            : null,
                        margin: const EdgeInsets.all(20),
                        child: imagePath3 == ''
                            ? takePictureButton(3)
                            : picture(3),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            // ボタンが押された時の処理
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            "アップロード",
            style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
