import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class DiceScreen extends StatefulWidget {
  const DiceScreen({Key? key}) : super(key: key);

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice = 1;
  void update() {
    setState(() {
      Random dicenumber = Random();
      dice = dicenumber.nextInt(6) + 1;
    });
  }

  int coin = 1;
  void updatecoin() {
    setState(() {
      Random coinnumber = Random();
      coin = coinnumber.nextInt(2) + 1;
    });
  }

  int rps = 1;
  void updaterps() {
    setState(() {
      Random rpsnumber = Random();
      rps = rpsnumber.nextInt(3) + 1;
    });
  }

  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          _dicePage(),
          _coinPage(),
          _rpsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.grey.shade900,
        iconSize: 25,
        containerHeight: 70,
        itemCornerRadius: 50,
        curve: Curves.easeOutQuad,
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          });
        },
        items: [
          BottomNavyBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.dice,
              ),
              title: const Text(
                "Dice",
                style: TextStyle(fontSize: 23, fontFamily: 'Pop'),
              ),
              activeColor: Colors.purple),
          BottomNavyBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.bitcoin,
              ),
              title: const Text(
                "Coin",
                style: TextStyle(fontSize: 23, fontFamily: 'Pop'),
              ),
              activeColor: Colors.orange),
          BottomNavyBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.americanSignLanguageInterpreting,
              ),
              title: const Text(
                "RPS",
                style: TextStyle(fontSize: 23, fontFamily: 'Pop'),
              ),
              activeColor: Colors.red),
        ],
      ),
    );
  }

  Widget _dicePage() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        const Text(
          'Dice Game',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent,
              fontFamily: 'Mon'),
        ),
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          'assets/dice$dice.svg',
          height: 300,
        ),
        const SizedBox(
          height: 120,
        ),
        AnimatedButton(
          onPress: () {
            update();
          },
          height: 60,
          width: 170,
          text: 'ROLL',
          gradient: const LinearGradient(
              colors: [Colors.purpleAccent, Colors.blueAccent]),
          selectedGradientColor: const LinearGradient(
              colors: [Colors.pinkAccent, Colors.purpleAccent]),
          isReverse: true,
          selectedTextColor: Colors.white,
          transitionType: TransitionType.LEFT_CENTER_ROUNDER,
          textStyle: const TextStyle(
            fontFamily: 'Sf',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          borderColor: Colors.white,
          borderRadius: 50,
          borderWidth: 2,
        ),
      ],
    );
  }

  Widget _coinPage() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        const Text(
          'Heads or Tails',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'Mon',
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/coin$coin.png',
          height: 300,
        ),
        const SizedBox(
          height: 120,
        ),
        AnimatedButton(
          onPress: () {
            updatecoin();
          },
          height: 60,
          width: 170,
          text: 'FLIP',
          gradient:
              const LinearGradient(colors: [Colors.yellow, Colors.orange]),
          selectedGradientColor: const LinearGradient(
              colors: [Colors.orangeAccent, Colors.yellowAccent]),
          isReverse: true,
          selectedTextColor: Colors.white,
          transitionType: TransitionType.LEFT_CENTER_ROUNDER,
          textStyle: const TextStyle(
            fontFamily: 'Sf',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          borderColor: Colors.white,
          borderRadius: 50,
          borderWidth: 2,
        ),
      ],
    );
  }

  Widget _rpsPage() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        const Text(
          'Rock Paper Scissor',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontFamily: 'Mon',
            color: Colors.red,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Image.asset(
          'assets/rps$rps.png',
          height: 300,
        ),
        const SizedBox(
          height: 120,
        ),
        AnimatedButton(
          onPress: () {
            updaterps();
          },
          height: 60,
          width: 170,
          text: 'PLAY',
          gradient: const LinearGradient(colors: [Colors.red, Colors.orange]),
          selectedGradientColor: const LinearGradient(
              colors: [Colors.redAccent, Colors.orangeAccent]),
          isReverse: true,
          selectedTextColor: Colors.white,
          transitionType: TransitionType.LEFT_CENTER_ROUNDER,
          textStyle: const TextStyle(
            fontFamily: 'Sf',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          borderColor: Colors.white,
          borderRadius: 50,
          borderWidth: 2,
        ),
      ],
    );
  }
}
