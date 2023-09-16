import 'package:dualcamsapp/widgets/camerashoot.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FractionallySizedBox(
              widthFactor:
                  1.0, // Utilisez 1.0 pour occuper la moitié de l'écran
              heightFactor:
                  0.8, // Utilisez 0.5 pour occuper la moitié de la hauteur
              alignment: Alignment.topCenter, // Pour positionner en haut
              child: CameraShoot(),
            ),
          ),
          Center(
            child: OutlinedButton(
              child: Text("YffgO"),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
