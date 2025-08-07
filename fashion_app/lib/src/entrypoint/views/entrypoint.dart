import 'package:fashion_app/common/utils/colors.dart';
import 'package:fashion_app/common/widgets/app_style.dart';
import 'package:fashion_app/src/cart/views/cart_screen.dart';
import 'package:fashion_app/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:fashion_app/src/home/views/home_screen.dart';
import 'package:fashion_app/src/profile/views/profile_screen.dart';
import 'package:fashion_app/src/wishlist/views/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends StatelessWidget {
  
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishlistPage(),
    const Cartpage(),
    
    const ProfilePage(),
  ];

  final List<String> routePaths = [
    '/home',
    
    '/wishlist',
    '/cart',
    '/profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
      builder: (context, tabindexnotifier, child) {
        return Scaffold(
          body: Stack(
            children: [
              pageList[tabindexnotifier.index],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: MColors.kOffWhite,
                  ),
                  child: BottomNavigationBar(
                      selectedFontSize: 12,
                      elevation: 0,
                      showSelectedLabels: true,
                      showUnselectedLabels: false,
                      unselectedIconTheme: const IconThemeData(
                        color: Colors.black38,
                      ),
                      backgroundColor: MColors.kOffWhite,
                      selectedItemColor: MColors.kPrimary,
                      unselectedItemColor: MColors.kGray,
                      selectedLabelStyle: appStyle(
                        12,
                        MColors.kPrimary,
                        FontWeight.w500,
                      ),
                      currentIndex: tabindexnotifier.index,
                      onTap: (value) {
                        print(value);
                        tabindexnotifier.setindex(value);
                        // context.push(routePaths[value]);
                      },
                      items: [
                        BottomNavigationBarItem(
                            label: 'Home',
                            icon: Icon(
                              AntDesign.home,
                              color: tabindexnotifier.index == 0
                                  ? MColors.kPrimary
                                  : MColors.kGray,
                              size: 24,
                              semanticLabel: 'Home',
                            )),
                        BottomNavigationBarItem(
                            label: 'Wishlist',
                            icon: Icon(
                              AntDesign.hearto,
                              color: tabindexnotifier.index == 1
                                  ? MColors.kPrimary
                                  : MColors.kGray,
                              size: 24,
                              semanticLabel: 'Wishlist',
                            )),
                        BottomNavigationBarItem(
                            label: 'Cart',
                            icon: Badge(
                              label: const Text('9'),
                              child: Icon(
                                MaterialCommunityIcons.shopping_outline,
                                color: tabindexnotifier.index == 2
                                    ? MColors.kPrimary
                                    : MColors.kGray,
                                size: 24,
                                semanticLabel: 'Cart',
                              ),
                            )),
                        BottomNavigationBarItem(
                            label: 'Profile',
                            icon: Icon(
                              EvilIcons.user,
                              color: tabindexnotifier.index == 3
                                  ? MColors.kPrimary
                                  : MColors.kGray,
                              size: 34,
                              semanticLabel: 'Profile',
                            ))
                      ]),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
