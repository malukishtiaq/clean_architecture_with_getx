import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import '../config/color_scheme.dart';
import '../tools/functions/permissions.dart';

class ImageService extends GetxController {
  factory ImageService() {
    if (Get.isRegistered<ImageService>()) {
      return Get.find<ImageService>();
    } else {
      return Get.put(ImageService._());
    }
  }

  ImageService._();

  final _imagePicker = ImagePicker();
  final Rx<String?> _avatarImage = ''.obs;
  final Rx<List<int>?> _avatarBytes = Rx([0, 0, 0, 0, 0, 0, 0, 0]);

  Future<void> getPhotoFromCamera() async {
    try {
      final hasCameraPermission = await requestPermissionCamera();

      if (hasCameraPermission) {
        final photoFile = await _imagePicker.pickImage(
          imageQuality: 50,
          source: ImageSource.camera,
          requestFullMetadata: true,
        );

        if (photoFile != null && photoFile.path.isNotEmpty) {
          await crop(photoFile.path);
        }
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> getPhotoFromGallery() async {
    try {
      final XFile? _pickedFile = await _imagePicker.pickImage(
        imageQuality: 50,
        source: ImageSource.gallery,
        requestFullMetadata: true,
      );

      if (_pickedFile != null) {
        await crop(_pickedFile.path);
      }
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  //TODO refactor  from CroppedFile? to void
  Future<CroppedFile?> crop(String imageFilePath) async {
    CroppedFile? croppedImage;
    croppedImage = await ImageCropper().cropImage(
      cropStyle: CropStyle.circle,
      sourcePath: imageFilePath,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: baseScheme.onSurface,
          toolbarWidgetColor: baseScheme.onSurfaceVariant,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          presentStyle: CropperPresentStyle.page,
          enableZoom: true,
          mouseWheelZoom: true,
          showZoomer: true,
          enableOrientation: true,
          enableExif: true,
          enforceBoundary: false,
          context: Get.context!,
          boundary: CroppieBoundary(
            width: Get.mediaQuery.size.width.toInt(),
            height: (Get.mediaQuery.size.height * 0.8).toInt(),
          ),
          translations: const WebTranslations(
            title: 'Crop Image',
            rotateLeftTooltip: 'Rotate 90 degree counter-clockwise',
            rotateRightTooltip: 'Rotate 90 degree clockwise',
            cancelButton: 'Cancel',
            cropButton: 'Crop',
          ),
          viewPort: const CroppieViewPort(
            width: 300,
            height: 300,
          ),
        ),
      ],
    );
    if (kIsWeb) {
      _avatarBytes.value = await croppedImage?.readAsBytes();
    }
    _avatarImage.value = croppedImage?.path;
    return croppedImage;
  }

  Rx<String?> get croppedPath => _avatarImage;
  Rx<List<int>?> get croppedBytes => _avatarBytes;
  String? get mimeType {
    final mime =
        lookupMimeType(_avatarImage.value ?? '', headerBytes: [0xff, 0xd8]);
    return mime ?? '';
  }
}
