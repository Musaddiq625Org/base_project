import 'dart:io';
import 'package:base_project/src/constants/color_constants.dart';
import 'package:base_project/src/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:photo_view/photo_view.dart';

class CustomImagePreview extends StatefulWidget {
  final GestureTapCallback? imageCroped, onButtonSubmit, onButtonCancel;
  final Function(String) onImagePath;
  final String path;

  const CustomImagePreview(
      {this.path = '',
      this.imageCroped,
      this.onButtonSubmit,
      this.onButtonCancel,
      required this.onImagePath(_)});

  @override
  _CustomImagePreviewState createState() => _CustomImagePreviewState();
}

class _CustomImagePreviewState extends State<CustomImagePreview> {
  String? cropImagePath;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Container(),
          actions: <Widget>[
            InkWell(
              enableFeedback: true,
              onTap: () {
                _cropImage(widget.path);
              },
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(Icons.crop),
              ),
            )
          ],
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: PhotoView(
                imageProvider: FileImage(
                  File(getImageCroppedNot(cropImagePath ?? widget.path)),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConstants.red,
                  ),
                  onPressed: widget.onButtonCancel,
                  child: Text(
                    StringConstants.cancel,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: ColorConstants.logoGreen,
                      ),
                      onPressed: () {
                        widget.onImagePath(cropImagePath ?? widget.path);
                      },
                      child: Text(
                        StringConstants.confirm,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }

  //get cropped image or orignal image
  String getImageCroppedNot(path) {
    return path;
  }

  Future<void> _cropImage(String path) async {
    final croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit',
          toolbarColor: Colors.black,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          activeControlsWidgetColor: Colors.black,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Edit',
        ),
      ],
    );
    if (croppedFile != null) {
      cropImagePath = croppedFile.path;
      setState(() {});
    }
  }
}
