import 'package:flutter/material.dart';
import 'package:serenio/src/pages/help/help.dart';
import 'package:serenio/src/pages/person_details/person_detail.dart';

class BasePage extends StatefulWidget {
  BasePage({super.key, required this.phoneNumber});

  TextEditingController phoneNumber = TextEditingController();

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          PersonDetailsTab(phoneNumber: widget.phoneNumber),
          const HelpTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Eu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Ajuda",
          ),
        ],
      ),
    );
  }
}
