import 'package:best_phone/screens/categories/battery_life.dart';
import 'package:best_phone/screens/categories/camera_phone.dart';
import 'package:best_phone/screens/categories/compact_phone.dart';
import 'package:best_phone/screens/categories/entry_level.dart';
import 'package:best_phone/screens/categories/flagship_killer.dart';
import 'package:best_phone/screens/categories/flagship_phone.dart';
import 'package:best_phone/screens/categories/gaming_phone.dart';
import 'package:best_phone/screens/categories/midrange.dart';
import 'package:best_phone/screens/categories/premium.dart';
import 'package:best_phone/style/style.dart';
import 'package:best_phone/widgets/category_list_tile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int screenIndex = 0;
  bool isEntryActive = true;
  bool isMidRangeActive = false;
  bool isPremiumActive = false;
  bool isFlagPhoneActive = false;
  bool isFlagKillerActive = false;
  bool isBatteryActive = false;
  bool isCameraActive = false;
  bool isGamingActive = false;
  bool isCompactActive = false;

  List screens = [
    EntryLevel(
      'https://www.gsmarena.com/best_entry_level_smartphones_buyers_guide-review-2034.php',
      'https://www.gsmarena.com'
    ),
    Midrange(
      'https://www.gsmarena.com/best_midrange_allrounders_buyers_guide-review-2032.php',
      'https://www.gsmarena.com'
    ),
    Premium(
      'https://www.gsmarena.com/best_premium_allrounders_buyers_guide-review-2033.php',
      'https://www.gsmarena.com'
    ),
    FlagshipPhone(
      'https://www.gsmarena.com/best_flagship_phones_buyers_guide-review-2027.php',
      'https://www.gsmarena.com'
    ),
    FlagshipKiller(
      'https://www.gsmarena.com/best_flagship_killers_buyers_guide-review-2039.php',
      'https://www.gsmarena.com'
    ),
    BatteryLife(
      'https://www.gsmarena.com/phones_best_battery_life_buyers_guide-review-2028.php',
      'https://www.gsmarena.com'
    ),
    CameraPhone(
      'https://www.gsmarena.com/best_camera_phones_buyers_guide-review-2030.php',
      'https://www.gsmarena.com'
    ),
    GamingPhone(
      'https://www.gsmarena.com/best_gaming_phones_buyers_guide-review-2031.php',
      'https://www.gsmarena.com'
    ),
    CompactPhone(
      'https://www.gsmarena.com/best_compact_phones_buyers_guide-review-2029.php',
      'https://www.gsmarena.com'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Rankings"),
      ),
      body: screens[screenIndex],
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Text("CATEGORIES", style: categoryHeaderStyle),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 0;
                      isEntryActive = true;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Entry-level Smartphones',
                    isActive: isEntryActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 1;
                      isEntryActive = false;
                      isMidRangeActive = true;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Midrange all-rounders',
                    isActive: isMidRangeActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 2;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = true;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Premium all-rounders',
                    isActive: isPremiumActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 3;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = true;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Flagship Phones',
                    isActive: isFlagPhoneActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 4;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = true;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Flagship Killers',
                    isActive: isFlagKillerActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 5;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = true;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Battery life champions',
                    isActive: isBatteryActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 6;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = true;
                      isGamingActive = false;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile(
                    title: 'Camera Phones',
                    isActive: isCameraActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 7;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = true;
                      isCompactActive = false;
                    });
                  },
                  child: CategoryListTile( 
                    title: 'Gaming Phones',
                    isActive: isGamingActive,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screenIndex = 8;
                      isEntryActive = false;
                      isMidRangeActive = false;
                      isPremiumActive = false;
                      isFlagPhoneActive = false;
                      isFlagKillerActive = false;
                      isBatteryActive = false;
                      isCameraActive = false;
                      isGamingActive = false;
                      isCompactActive = true;
                    });
                  },
                  child: CategoryListTile( 
                    title: 'Compact phones',
                    isActive: isCompactActive,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}