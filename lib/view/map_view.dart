import 'package:coffeshop/utils/app_palette.dart';
import 'package:coffeshop/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapViewState();
}

class _MapViewState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(-8.00313354515998, -38.304421446153675),
              maxZoom: 20,
              minZoom: 2,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/mapbox/streets-v12/tiles/"
                    "{z}/{x}/{y}?access_token=sk.eyJ1IjoibW91cmE5OCIsImEiOiJjbHN2eGs5Ynkyam5xMm1wN3N4cnAxanB4In0.guKFhbBBO2jppCpW_O0A2g",
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-8.00313354515998, -38.304421446153675),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppPalette.white,
                        ),
                        child: Image.asset('assets/images/bike.png'),
                      ),
                    ),
                  ),
                  Marker(
                    width: 80.0,
                    height: 80.0,
                    point: LatLng(-7.982309303491958, -38.27717020323581),
                    child: Image.asset(
                      'assets/images/pin.png',
                      width: 16.67,
                      height: 16.67,
                    ),
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      LatLng(-8.00313354515998, -38.304421446153675),
                      LatLng(-7.982309303491958, -38.27717020323581),
                    ],
                    strokeWidth: 1.0,
                    color: AppPalette.primary,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RoutesApp.ORDER);
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppPalette.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/icons/arrow-left.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 230),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppPalette.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset('assets/icons/gps.svg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 8,
            left: MediaQuery.of(context).size.width / 3,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppPalette.white,
                ),
                child: const Text(
                  'Informações',
                  style: TextStyle(color: AppPalette.blacklight2),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 322,
                        decoration: BoxDecoration(
                          color: AppPalette.white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 44,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5),
                                  color: AppPalette.color1,
                                ),
                              ),
                              Column(
                                children: [
                                  const Text(
                                    '10 minutes left',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Delivery to ',
                                          style: TextStyle(
                                            color: AppPalette.blacklight4,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Jl. Kpg Sutoyo',
                                          style: TextStyle(
                                            color: AppPalette.blacklight2,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 65.25,
                                          height: 4,
                                          color: AppPalette.green,
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 65.25,
                                          height: 4,
                                          color: AppPalette.green,
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 65.25,
                                          height: 4,
                                          color: AppPalette.green,
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 65.25,
                                          height: 4,
                                          color: AppPalette.graylight5,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    width: 310,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        width: 1,
                                        color: AppPalette.color1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 62,
                                          height: 62,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              width: 1,
                                              color: AppPalette.color1,
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/images/bike.png',
                                          ),
                                        ),
                                        const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Delivered your order',
                                              style: TextStyle(
                                                color: AppPalette.blacklight4,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              'We deliver your goods to you in \nthe shortes possible time.',
                                              style: TextStyle(
                                                color: AppPalette.blacklight2,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset(
                                            'assets/images/perfil2.png',
                                          ),
                                          const SizedBox(width: 5),
                                          const Column(
                                            children: [
                                              Text(
                                                'Johan Hawn',
                                                style: TextStyle(
                                                  color: AppPalette.blacklight4,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Personal Courier',
                                                style: TextStyle(
                                                  color: AppPalette.blacklight2,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 30),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 54,
                                          height: 54,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            border: Border.all(
                                              width: 1,
                                              color: AppPalette.border,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: SvgPicture.asset(
                                              'assets/icons/telpon.svg',
                                              width: 24,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
