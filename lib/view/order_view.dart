import 'package:coffeshop/utils/app_palette.dart';
import 'package:coffeshop/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  int selectedIndex = 0;
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Order',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, RoutesApp.DETAILITEM);
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
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildSelection(),
              const SizedBox(height: 20),
              selectedIndex == 0 ? _buildDelivery() : _buildPickUp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelection() {
    return Container(
      width: 315,
      height: 48,
      decoration: BoxDecoration(
        color: AppPalette.graylight3,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            child: Container(
              width: 153.5,
              height: 40,
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? AppPalette.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Delivery',
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? AppPalette.white
                        : AppPalette.blacklight3,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            child: Container(
              width: 153.5,
              height: 40,
              decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? AppPalette.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Pick Up',
                  style: TextStyle(
                    color: selectedIndex == 1
                        ? AppPalette.white
                        : AppPalette.blacklight3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDelivery() {
    return SizedBox(
      width: 315,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Address',
            style: TextStyle(
              color: AppPalette.blacklight3,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Jl. Kpg Sutoyo',
            style: TextStyle(
              color: AppPalette.blacklight4,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
            style: TextStyle(
              color: AppPalette.graylight2,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 27,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppPalette.border, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/edit.svg',
                      width: 14,
                      height: 14,
                    ),
                    const Text(
                      'Edit Address',
                      style: TextStyle(
                        color: AppPalette.blacklight4,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 101,
                height: 27,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppPalette.border, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/document.svg',
                      width: 14,
                      height: 14,
                    ),
                    const Text(
                      'Add Note',
                      style: TextStyle(
                        color: AppPalette.blacklight4,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: 315,
            decoration: BoxDecoration(
              border: Border.all(color: AppPalette.color1, width: 1),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/cappucino1.png',
                    width: 54,
                    height: 54,
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Cappuccino\n',
                          style: TextStyle(
                            color: AppPalette.blacklight3,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'with Chocolate',
                          style: TextStyle(
                            color: AppPalette.graylight,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        num = num - 1;
                      });
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppPalette.color1, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.remove, color: AppPalette.color1),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text('$num'.toString()),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        num = num + 1;
                      });
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: AppPalette.color1, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(Icons.add, color: AppPalette.color1),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(width: 375, height: 4, color: AppPalette.white3),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            width: 315,
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(width: 1, color: AppPalette.color1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/icons/discount.svg'),
                const Text(
                  '1 Discount is applied',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppPalette.blacklight3,
                  ),
                ),
                const SizedBox(width: 50),
                SvgPicture.asset('assets/icons/arrow-right.svg'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 315,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Payment Summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$ 4.53',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ 2.0 ',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        Text(
                          ' \$ 1.0',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: 315,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppPalette.color1),
                  ),
                ),
                SizedBox(height: 5),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payment ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      ' \$ 5.53',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 376,
            height: 161,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/moneys.svg'),
                    const SizedBox(width: 15),
                    Container(
                      width: 112,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppPalette.graylight4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 51,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppPalette.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                'Cash',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppPalette.white,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                '\$ 5.53',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppPalette.blacklight3,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 130),
                    Image.asset('assets/icons/dots.png'),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RoutesApp.MAP);
                  },
                  child: Container(
                    width: 315,
                    height: 62,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppPalette.primary,
                    ),
                    child: const Center(
                      child: Text(
                        'Order',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppPalette.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPickUp() {
    return Container();
  }
}
