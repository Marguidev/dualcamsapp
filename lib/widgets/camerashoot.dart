import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraShoot extends StatefulWidget {
  @override
  _CameraShootState createState() => _CameraShootState();
}

class _CameraShootState extends State<CameraShoot> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Initialisation de la caméra
    _controller = CameraController(
      const CameraDescription(
        name: '0',
        lensDirection: CameraLensDirection.back, // Caméra arrière
        sensorOrientation: 0, // Spécifiez la valeur de l'orientation du capteur
      ),
      ResolutionPreset.medium, // Ajustez la résolution si nécessaire
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Libérer les ressources de la caméra lorsqu'elles ne sont plus nécessaires
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      // Attendez que la caméra soit initialisée
      await _initializeControllerFuture;

      // Prenez une photo
      final XFile picture = await _controller.takePicture();

      // Obtenez le répertoire de stockage externe
      Directory appDirectory =
          (await getExternalStorageDirectory()) ?? Directory('/default/path');
      final String appPath = appDirectory.path;

      // Copiez l'image capturée dans le répertoire de stockage
      final File savedImage = File('$appPath/picture.jpg');
      await File(picture.path).copy(savedImage.path);

      // Affichez l'image dans une nouvelle page ou faites ce que vous souhaitez
      // Vous pouvez utiliser le package image pour manipuler l'image si nécessaire
    } catch (e) {
      print('Erreur lors de la capture de l\'image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Si la caméra est prête, affichez le flux de caméra
                return CameraPreview(_controller);
              } else {
                // Sinon, affichez un indicateur de chargement
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        ElevatedButton(
          onPressed: _takePicture,
          child: Icon(Icons.camera), // Remplacez le texte par l'icône
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(), // Pour un bouton en forme de cercle
            padding: EdgeInsets.all(16.0), // Ajustez la taille du bouton
          ),
        )
      ],
    );
  }
}
