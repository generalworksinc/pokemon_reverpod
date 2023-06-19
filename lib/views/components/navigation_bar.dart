import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

var botoom_navigation_bar = (BuildContext context) => BottomNavigationBar(
      onTap: (index) {
        debugPrint("index: ${index}");
        switch (index) {
          case 0:
            context.pushNamed("top");
            break;
          case 1:
            context.pushNamed("settings");
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'settings',
        )
      ],
    );
