import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _requestCameraPermission() async {
    final permission = await Permission.camera;
    if (await permission.isDenied) {
      final result = await permission.request();
      if (result.isGranted) {
      } else if (result.isDenied) {
      } else if (result.isPermanentlyDenied) {}
    }
    // _showPermissionDeniedMessage();
    // if (status.isGranted) {
    //   _openCamera();
    // } else if (status.isDenied) {
    //   _showPermissionDeniedMessage();
    // } else if (status.isPermanentlyDenied) {
    //   openAppSettings();
    // }
  }

  Future<void> _openCamera() async {
    print('abrindo camera');
    // try {
    //   final image = await _picker.pickImage(source: ImageSource.camera);
    //   if (image != null) {
    //     setState(() {
    //       _image = image;
    //     });
    //   }
    // } catch (e) {
    //   print("Erro ao abrir a câmera: $e");
    // }
  }

  void _showPermissionDeniedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Permissão para usar a câmera foi negada.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tirar Foto")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null) Image.file(File(_image!.path)),
            ElevatedButton(
              onPressed: _requestCameraPermission,
              child: const Text("Abrir Câmera"),
            ),
          ],
        ),
      ),
    );
  }
}
