import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:walletwizard/view/SettingsScreen/settingsScreen.dart';
import 'package:walletwizard/view/StatiticsScreen/statiticsScreen.dart';
import 'package:walletwizard/view/Transactionhistorypage/transactionHistory.dart';
import 'package:walletwizard/view/AddTransactionScreen/addTransactionScreen.dart';
import 'package:walletwizard/view/homeScreen/homeScreen.dart';





class bottumNavigationpage extends StatefulWidget {
  String username;
   bottumNavigationpage(   {
    Key? key,
    required this.username,
  }) : super(key: key
  );

  @override
  State<bottumNavigationpage> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<bottumNavigationpage> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_rounded,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            // selectedColor: Colors.teal,
            backgroundColor: Colors.teal,
            title: const Text('Home'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.bar_chart_rounded),
            selectedIcon: const Icon(Icons.bar_chart_rounded),
            selectedColor: Colors.teal,
            // unSelectedColor: Colors.purple,
            backgroundColor: Colors.teal,
            title: const Text('Statitics'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.account_balance_wallet_rounded,
              ),
              selectedIcon: const Icon(
                Icons.account_balance_wallet_rounded,
              ),
              backgroundColor: Colors.teal,
              selectedColor: Colors.deepOrangeAccent,
              title: const Text('History')),
          BottomBarItem(
              icon: const Icon(
                Icons.settings,
              ),
              selectedIcon: const Icon(
                Icons.settings,
              ),
              backgroundColor: Colors.teal,
              selectedColor: Colors.deepPurple,
              title: const Text('settings')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>AddTransactionScreen(username: widget.username,)));
        },
        backgroundColor: Colors.white,
        child: Icon(
           CupertinoIcons.add_circled_solid ,
          color: Colors.teal,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
           physics: const NeverScrollableScrollPhysics(),
          children:  [
            homeScreen(username: widget.username,),
            statiticsScreen(),
            transactionHistoryScreen(username: widget.username,),
            settingsScreen(),
          ],
        ),
      ),
    );
  }
}


// //Example to setup Bubble Bottom Bar with PageView
// class BubbelBarExample extends StatefulWidget {
//   const BubbelBarExample({Key? key}) : super(key: key);

//   @override
//   State<BubbelBarExample> createState() => _BubbelBarExampleState();
// }

// class _BubbelBarExampleState extends State<BubbelBarExample> {
//   PageController controller = PageController(initialPage: 0);
//   var selected = 0;

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: controller,
//         children: const [
//                  homeScreen(),
//             statiticsScreen(),
//             transactionHistoryScreen(),
//             settingsScreen(),
//         ],
//       ),
//       bottomNavigationBar: StylishBottomBar(
//         option: BubbleBarOptions(
//           barStyle: BubbleBarStyle.vertical,
//           // barStyle: BubbleBarStyle.vertical,
//           bubbleFillStyle: BubbleFillStyle.fill,
//           // bubbleFillStyle: BubbleFillStyle.outlined,
//           opacity: 0.3,
//         ),
//         items: [
//           BottomBarItem(
//             icon: const Icon(Icons.abc),
//             title: const Text('Abc'),
//             backgroundColor: Colors.red,

//             // selectedColor: Colors.pink,
//             selectedIcon: const Icon(Icons.read_more),
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.safety_divider),
//             title: const Text('Safety'),
//             selectedColor: Colors.orange,
//           ),
//           BottomBarItem(
//             icon: const Icon(Icons.cabin),
//             title: const Text('Cabin'),
//             backgroundColor: Colors.purple,
//           ),
//         ],
//         fabLocation: StylishBarFabLocation.end,
//         // hasNotch: true,
//         currentIndex: selected,
//         onTap: (index) {
//           setState(() {
//             selected = index;
//             controller.jumpToPage(index);
//           });
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: const Icon(Icons.emoji_emotions),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
//     );
//   }
// }