import 'package:coffeshop/utils/app_palette.dart';
import 'package:coffeshop/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailItemView extends StatefulWidget {
  const DetailItemView({super.key});

  @override
  State<DetailItemView> createState() => _DetailItemViewState();
}

class _DetailItemViewState extends State<DetailItemView> {
  String selectedSize = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: const Text(
          'Detail',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, RoutesApp.HOME);
          },
          child: Container(
            padding: const EdgeInsets.only(left: 14, right: 10, bottom: 2),
            child: SvgPicture.asset(
              'assets/icons/arrow-left.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                'assets/icons/heart.svg',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/cappucino1.png',
                  width: 315,
                  height: 226,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Cappucino',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppPalette.blacklight3,
                      ),
                    ),
                    const Text(
                      'with Chocolate',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppPalette.graylight,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star, color: AppPalette.yellow),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '4.8',
                                    style: TextStyle(
                                      color: AppPalette.blacklight3,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' (230)',
                                    style: TextStyle(
                                      color: AppPalette.graylight2,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppPalette.white2,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Image.asset(
                                'assets/icons/bean.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: AppPalette.white2,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Image.asset(
                                'assets/icons/milk.png',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Container(
                        width: 315,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppPalette.color1,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: AppPalette.blacklight3,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
                            style: TextStyle(
                              color: AppPalette.graylight,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: 'Read More',
                            style: TextStyle(
                              color: AppPalette.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Size',
                      style: TextStyle(
                        color: AppPalette.blacklight3,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildCustomSize(selectedSize == 'S', 'S'),
                        _buildCustomSize(selectedSize == 'M', 'M'),
                        _buildCustomSize(selectedSize == 'L', 'L'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 376,
              height: 121,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: AppPalette.graylight,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '\$ 4.53',
                        style: TextStyle(
                          color: AppPalette.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RoutesApp.ORDER);
                    },
                    child: Container(
                      width: 217,
                      height: 62,
                      decoration: BoxDecoration(
                        color: AppPalette.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppPalette.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomSize(bool selected, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = text;
        });
      },
      child: Container(
        width: 96,
        height: 43,
        decoration: BoxDecoration(
          color: selected
              ? AppPalette.primary.withOpacity(0.5)
              : AppPalette.white,
          border: Border.all(
            color: selected ? AppPalette.primary : AppPalette.border,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: selected ? AppPalette.primary : AppPalette.blacklight3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
