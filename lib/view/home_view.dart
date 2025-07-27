import 'package:coffeshop/utils/app_palette.dart';
import 'package:coffeshop/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum CoffeeType { Cappucino, Machiato, Latte, Americano }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CoffeeType? selectedCoffee;
  int viewscreen = 0;

  // Location variables
  String selectedCity = 'Bilzen';
  String selectedCountry = 'Tanjungbalai';
  bool showLocationDropdown = false;

  // Sample location data
  final List<Map<String, String>> locations = [
    {'city': 'Bilzen', 'country': 'Tanjungbalai'},
    {'city': 'New York', 'country': 'United States'},
    {'city': 'London', 'country': 'United Kingdom'},
    {'city': 'Paris', 'country': 'France'},
    {'city': 'Tokyo', 'country': 'Japan'},
    {'city': 'Sydney', 'country': 'Australia'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 280,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppPalette.blacklight,
                            AppPalette.blacklight2,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showLocationDropdown =
                                          !showLocationDropdown;
                                    });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Location',
                                        style: TextStyle(
                                          color: AppPalette.gray,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '$selectedCity, $selectedCountry',
                                            style: const TextStyle(
                                              color: AppPalette.white,
                                            ),
                                          ),
                                          Icon(
                                            showLocationDropdown
                                                ? Icons.keyboard_arrow_up
                                                : Icons.keyboard_arrow_down,
                                            color: AppPalette.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Location dropdown
                          if (showLocationDropdown)
                            Container(
                              // margin: const EdgeInsets.symmetric(
                              //   horizontal: 15,
                              // ),
                              decoration: BoxDecoration(
                                color: AppPalette.blacklight2,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: locations.map((location) {
                                  return ListTile(
                                    title: Text(
                                      '${location['city']}, ${location['country']}',
                                      style: const TextStyle(
                                        color: AppPalette.white,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        selectedCity = location['city']!;
                                        selectedCountry = location['country']!;
                                        // showLocationDropdown = false;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            ),

                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 315,
                              height: 52,
                              decoration: BoxDecoration(
                                color: AppPalette.blacklight2,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      'assets/icons/search.svg',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: AppPalette.primary,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/filter.svg',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: SizedBox(
                        height: 38,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCoffeeTypeButton(
                              'Cappucino',
                              CoffeeType.Cappucino,
                            ),
                            _buildCoffeeTypeButton(
                              'Machiato',
                              CoffeeType.Machiato,
                            ),
                            _buildCoffeeTypeButton('Latte', CoffeeType.Latte),
                            _buildCoffeeTypeButton(
                              'Americano',
                              CoffeeType.Americano,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (selectedCoffee != null) ...[
                      _buildCoffeeList(selectedCoffee!),
                    ],
                  ],
                ),
                SizedBox(height: 20),
                Positioned(
                  top: showLocationDropdown ? 240 : 190,
                  right: 0,
                  left: 20,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/promo.png',
                          width: 315,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(6),
        width: 376,
        height: 99,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildNavigationBarItem(0, 'assets/icons/icon1.svg'),
            _buildNavigationBarItem(1, 'assets/icons/icon2.svg'),
            _buildNavigationBarItem(2, 'assets/icons/icon3.svg'),
            _buildNavigationBarItem(3, 'assets/icons/icon4.svg'),
          ],
        ),
      ),
    );
  }

  Widget _buildCoffeeTypeButton(String text, CoffeeType type) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCoffee = type;
        });
      },
      child: Container(
        width: 99,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: selectedCoffee == type ? AppPalette.primary : AppPalette.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: selectedCoffee == type ? AppPalette.white : null,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCoffeeList(CoffeeType type) {
    switch (type) {
      case CoffeeType.Cappucino:
        return _buildCappucinoScreen();
      case CoffeeType.Machiato:
        return Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _buildDetail('assets/images/machiato1.png', true, 4.53, 4.8),
                  const SizedBox(width: 25),
                  _buildDetail('assets/images/machiato2.png', false, 3.90, 4.9),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _buildDetail('assets/images/machiato3.png', true, 4.53, 4.5),
                  const SizedBox(width: 25),
                  _buildDetail('assets/images/machiato4.png', false, 3.90, 4.0),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      case CoffeeType.Latte:
        return Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _buildDetail('assets/images/latte1.png', true, 4.53, 4.8),
                  const SizedBox(width: 25),
                  _buildDetail('assets/images/latte2.png', false, 3.90, 4.9),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _buildDetail('assets/images/latte3.png', true, 4.53, 4.5),
                  const SizedBox(width: 25),
                  _buildDetail('assets/images/latte4.png', false, 3.90, 4.0),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      case CoffeeType.Americano:
        return Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _buildDetail('assets/images/americano1.png', true, 4.53, 4.8),
                  const SizedBox(width: 25),
                  _buildDetail(
                    'assets/images/americano2.png',
                    false,
                    3.90,
                    4.9,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  _buildDetail('assets/images/americano3.png', true, 4.53, 4.5),
                  const SizedBox(width: 25),
                  _buildDetail(
                    'assets/images/americano4.png',
                    false,
                    3.90,
                    4.0,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      // Return an empty container if no coffee type is selected
    }
  }

  Widget _buildCappucinoScreen() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              _buildDetail('assets/images/cappucino1.png', true, 4.53, 4.8),
              const SizedBox(width: 25),
              _buildDetail('assets/images/cappucino2.png', false, 3.90, 4.9),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              _buildDetail('assets/images/cappucino3.png', true, 4.53, 4.5),
              const SizedBox(width: 25),
              _buildDetail('assets/images/cappucino4.png', false, 3.90, 4.0),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDetail(String image, bool chocolate, double price, double note) {
    return Container(
      width: 149,
      height: 239,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(image),
                  const Row(
                    children: [
                      Icon(Icons.star, color: AppPalette.yellow),
                      Text('4.8', style: TextStyle(color: AppPalette.white)),
                    ],
                  ),
                ],
              ),
              const Text(
                'Cappucino',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppPalette.blacklight3,
                ),
              ),
              Text(
                chocolate ? 'with Chocolate' : 'with Oat Milk',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppPalette.graylight,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$ ${price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesApp.DETAILITEM,
                      );
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppPalette.primary,
                      ),
                      child: const Icon(Icons.add, color: AppPalette.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBarItem(int index, String iconPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              viewscreen = index;
            });
          },
          child: SvgPicture.asset(
            iconPath,
            width: 24,
            height: 24,
            color: viewscreen == index
                ? AppPalette.primary
                : AppPalette.graylight2,
          ),
        ),
        if (viewscreen == index)
          Container(
            width: 10,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: AppPalette.primary,
            ),
          )
        else
          Container(),
      ],
    );
  }
}
