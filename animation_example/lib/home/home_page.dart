import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final duration = const Duration(seconds: 2);
  bool isDay = true;
  bool isNight = true;
  bool isFullSun = false;

  Future<void> determineSunMoonCycle(int v) async {
    if (v == 0) {
      isDay = true;
      isNight = true;
      setState(() {});
      await Future.delayed(const Duration(microseconds: 500));
      isFullSun = true;
      isNight = false;
      setState(() {});
    } else {
      isFullSun = false;
      isNight = true;
      setState(() {});
      await Future.delayed(const Duration(microseconds: 500));
      isDay = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    determineSunMoonCycle(0);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<Color> lightBgColors = [
      const Color(0xFF8C2480),
      const Color(0xFFCE587D),
      const Color(0xFFFF9485),
      if (isFullSun) const Color(0xFFFF9D80),
    ];

    var darkBgColors = const [
      Color(0xFF0D1441),
      Color(0xFF283584),
      Color(0xFF376AB2),
    ];

    return Scaffold(
      body: AnimatedContainer(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDay ? lightBgColors : darkBgColors,
          ),
        ),
        duration: duration,
        child: Stack(
          children: [
            AnimatedPositioned(
              left: 0,
              right: isNight ? 0 : -700,
              bottom: isNight ? 450 : 750,
              duration: duration,
              child: SvgPicture.asset(
                'assets/icons/moon.svg',
                colorFilter: const ColorFilter.mode(
                  Color.fromARGB(255, 247, 197, 15),
                  BlendMode.srcIn,
                ),
                height: 130,
                width: 130,
              ),
            ),
            AnimatedPositioned(
              left: 0,
              right: 0,
              bottom: isFullSun
                  ? 400
                  : isDay
                      ? -30
                      : -130,
              duration: duration,
              child: SvgPicture.asset('assets/icons/sun.svg'),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: -55,
              child: Image.asset(
                'assets/images/land_tree_light.png',
                height: 400,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              height: 60,
              width: width,
              margin: const EdgeInsets.fromLTRB(20, 130, 20, 0),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DefaultTabController(
                length: 2,
                child: TabBar(
                  onTap: determineSunMoonCycle,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.white,
                  labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  tabs: const [
                    Tab(text: 'Morning Light'),
                    Tab(text: 'Night Dark'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
