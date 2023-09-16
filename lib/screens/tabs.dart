import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dualcamsapp/providers/color_scheme.dart';
import 'package:dualcamsapp/screens/camera.dart';
import 'package:dualcamsapp/screens/galerie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _page = 0;
  Color backCouleur = Colors.black;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  String cameraTextIconToolbar = "Camera";
  String mesrecettesTextIconToolbar = "Galerie";
  String profileTextIconToolbar = "Profile";

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorSchemeProvider.of(context)?.colorScheme;

    Widget activePage = const GalerieScreen();

    // ignore: unused_local_variable
    var activePageTitle = "Galerie";

    if (_page == 0) {
      backCouleur = colorScheme!.primary;
      activePage = const GalerieScreen();
      // activePage = FavouritesScreen(
      //   listeRepasFavoris: favorisRepas,
      // );
      activePageTitle = 'Galerie';
    }
    if (_page == 1) {
      backCouleur = colorScheme!.primary;
      activePage = const CameraScreen();
      // activePage = FavouritesScreen(
      //   listeRepasFavoris: favorisRepas,
      // );
      activePageTitle = 'Camera';
    }
    if (_page == 2) {
      backCouleur = colorScheme!.primary;
      activePage = const GalerieScreen();
      // activePage = FavouritesScreen(
      //   listeRepasFavoris: favorisRepas,
      // );
      activePageTitle = 'Profile';
    }

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        color: colorScheme!.tertiary,
        key: _bottomNavigationKey,
        backgroundColor: colorScheme.primary,
        animationDuration: const Duration(milliseconds: 350),
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.list_alt_rounded,
                size: 40,
                color: _page == 0 ? colorScheme.secondary : colorScheme.primary,
              ),
              SizedBox(
                height: mesrecettesTextIconToolbar.isEmpty
                    ? 0
                    : 16, // Adjust the height as needed
                child: Text(
                  mesrecettesTextIconToolbar,
                  style: GoogleFonts.abel(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: colorScheme.background,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                _page == 1 ? Icons.camera_alt_outlined : Icons.camera_alt,
                size: 40,
                color: _page == 1 ? colorScheme.secondary : colorScheme.primary,
              ),
              SizedBox(
                height: cameraTextIconToolbar.isEmpty
                    ? 0
                    : 16, // Adjust the height as needed
                child: Text(
                  cameraTextIconToolbar,
                  style: GoogleFonts.abel(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: colorScheme.background,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                _page == 2
                    ? Icons.account_circle_rounded
                    : Icons.account_circle_outlined,
                size: 40,
                color: _page == 2 ? colorScheme.secondary : colorScheme.primary,
              ),
              SizedBox(
                height: profileTextIconToolbar.isEmpty
                    ? 0
                    : 16, // Adjust the height as needed
                child: Text(
                  profileTextIconToolbar,
                  style: GoogleFonts.abel(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: colorScheme.background,
                  ),
                ),
              ),
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            // Toggle the text visibility for the clicked icon
            mesrecettesTextIconToolbar = index == 0 ? "" : "Galerie";
            cameraTextIconToolbar = index == 1 ? "" : "Camera";
            profileTextIconToolbar = index == 2 ? "" : "Profile";

            // Update the current page
            _page = index;
          });
        },
      ),
      body: activePage,
    );
  }
}
