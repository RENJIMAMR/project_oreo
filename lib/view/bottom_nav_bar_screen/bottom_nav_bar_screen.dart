import 'package:flutter/material.dart';
import 'package:project_oreo/utils/constants/color_constants.dart';
import 'package:project_oreo/view/add_item_screen/add_item_screen.dart';
import 'package:project_oreo/view/home_screen/home_screen.dart';
import 'package:project_oreo/view/profile_screen/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  final int selectedIndex;

  const BottomNavBarScreen(
      {super.key, this.selectedIndex = 0}); // Default index is 0

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  late int selectedIndex;

  // Define the screens here
  final List<Widget> myScreens = [
    HomeScreen(),
    AddItemScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex; // Initialize the selected index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreens[selectedIndex], // Use the defined screens here
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        backgroundColor: ColorConstants.whiteMain,
        iconSize: 40,
        unselectedItemColor: ColorConstants.greyMain,
        selectedItemColor: ColorConstants.blueMain,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/asset_image/scanner.png'),
            ),
            label: 'Add Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
