import 'dart:developer';
import 'dart:io';
import 'package:base_project/components/media/custom_image_preview.dart';
import 'package:base_project/src/constants/color_constants.dart';
import 'package:base_project/src/constants/string_constants.dart';
import 'package:base_project/src/utils/logger_util.dart';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class MediaSourceSelectionWidget extends StatefulWidget {
  final GestureTapCallback? onTapGallery, onTapCamera;
  final Function(String) onImagePath;
  final double? imageMaxHeight;
  final double? imageMaxWidth;

  const MediaSourceSelectionWidget(
      {this.onTapGallery,
      this.onTapCamera,
      required this.onImagePath,
      this.imageMaxHeight,
      this.imageMaxWidth});

  @override
  _MediaSourceSelectionWidgetState createState() =>
      _MediaSourceSelectionWidgetState();
}

class _MediaSourceSelectionWidgetState
    extends State<MediaSourceSelectionWidget> {
  List<PickedFile> prescription = [];
  final ImagePicker _picker = ImagePicker();
  late PickedFile profileImage;

  bool isCameraReady = false;
  bool showCapturedPhoto = false;
  bool isImageSelectedCamera = false;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorConstants.white,
      title: Text(StringConstants.mediaSelection),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            InkWell(
              child: ListTile(
                leading: const Icon(
                  Icons.photo,
                  color: ColorConstants.logoBlue,
                ),
                title: Text(StringConstants.gallery),
              ),
              onTap: () {
                getImage(context);
              },
            ),
            const Padding(padding: EdgeInsets.all(8)),
            InkWell(
              child: ListTile(
                leading:
                    const Icon(Icons.camera, color: ColorConstants.logoBlue),
                title: Text(StringConstants.camera),
              ),
              onTap: () {
                getImageCamera(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  XFile? pickedImage;

  Future getImage(BuildContext context) async {
    pickedImage = await _picker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.front,
      maxHeight: widget.imageMaxHeight,
      maxWidth: widget.imageMaxWidth,
    );
    if (pickedImage != null) {
      final _pickedImage = await _compressImage(pickedImage!);
      imagePath = _pickedImage.path;
      // imagePath = pickedImage!.path;
      if (!mounted) return;
      showCustomImageView(context, false);
    }
  }

  Future getImageCamera(BuildContext context) async {
    pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
        maxHeight: widget.imageMaxHeight,
        maxWidth: widget.imageMaxWidth);
    if (pickedImage != null) {
      final _pickedImage = await _compressImage(pickedImage!);
      imagePath = _pickedImage.path;
      // imagePath = pickedImage!.path;
      if (!mounted) return;
      showCustomImageView(context, true);
    } else {
      log('No image selected.');
    }
  }

  void showCustomImageView(
    BuildContext context,
    bool imageSelectedCamera,
  ) {
    showDialog(
      context: context,
      builder: (_) => CustomImagePreview(
        path: imagePath!,
        onImagePath: (imagePath) {
          widget.onImagePath(imagePath);
          Navigator.pop(context);
          Navigator.pop(context);
        },
        onButtonCancel: () {
          Navigator.pop(context);
          if (isImageSelectedCamera) {
            deleteFile(imagePath!);
          }
        },
      ),
    );
  }

  Future<void> deleteFile(String path) async {
    try {
      final file = File(path);
      await file.delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<XFile> _compressImage(XFile file) async {
    LoggerUtil.logs('_compressImage');
    var compressFormat = CompressFormat.jpeg;
    try {
      final filePath = file.path;
      var lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      if (lastIndex == -1) {
        lastIndex = filePath.lastIndexOf(RegExp(r'.png'));
        compressFormat = CompressFormat.png;
      }
      final splittedPath = filePath.substring(0, lastIndex);
      final outPath = '${splittedPath}_out${filePath.substring(lastIndex)}';
      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        filePath,
        outPath,
        quality: 30,
        format: compressFormat,
      );
      if (compressedImage != null) {
        final xFile = XFile(compressedImage.path);
        return xFile;
      } else {
        return file;
      }
    } catch (e) {
      return file;
    }
  }
}
