import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../services/toast_service.dart';

class ImageService {
  static Future<File?> loadImageFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      return File(imagePath);
    }
    return null;
  }

  static Future<File?> pickImage() async {
    if (await _requestPhotoPermission()) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    }
    return null;
  }

  static Future<bool> _requestPhotoPermission() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    int sdkInt = androidInfo.version.sdkInt;

    if (sdkInt >= 33) {
      // Android 13 ve üzeri
      var status = await Permission.photos.status;
      if (status.isGranted) {
        return true;
      } else if (status.isDenied) {
        return await Permission.photos.request().isGranted;
      } else if (status.isPermanentlyDenied) {
        ToastService.showToast(
            'Galeriye erişim izni kalıcı olarak reddedildi. Ayarlardan izin vermeniz gerekiyor.');
        return false;
      }
    } else {
      // Android 12 ve altı
      var status = await Permission.storage.status;
      if (status.isGranted) {
        return true;
      } else if (status.isDenied) {
        return await Permission.storage.request().isGranted;
      } else if (status.isPermanentlyDenied) {
        ToastService.showToast(
            'Galeriye erişim izni kalıcı olarak reddedildi. Ayarlardan izin vermeniz gerekiyor.');
        return false;
      }
    }
    return false;
  }

  static Future<void> saveImageToCache(String imagePath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', imagePath);
  }
}
