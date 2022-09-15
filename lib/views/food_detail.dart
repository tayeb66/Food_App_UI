import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ap_ui/constant/colors.dart';
import 'package:food_ap_ui/constant/const.dart';
import 'package:food_ap_ui/style.dart';

import '../constant/widget.dart';

class FoodDetail extends StatelessWidget {
  final String? imagePath;
  const FoodDetail({Key? key,this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        style: TextButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: AppColor.primary,
          minimumSize: Size(MediaQuery.of(context).size.width-40, 56)
        ),
        onPressed: () {},
        child: const PrimaryText(
          text: 'Place an order',
          color: AppColor.black,
          size: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: ListView(
        children: [
          customAppbar(context),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PrimaryText(
                  text: 'Primavera\nPizza',
                  size: 40,
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/images/dollar.svg',
                      width: 15,
                      color: AppColor.tertiary,
                    ),
                    const PrimaryText(
                      text: '5.99',
                      size: 45,
                      fontWeight: FontWeight.w700,
                      color: AppColor.tertiary,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          PrimaryText(
                            text: 'Size',
                            size: 18,
                            color: AppColor.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: 'Medium size 14"',
                            size: 20,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PrimaryText(
                            text: 'Crust',
                            size: 18,
                            color: AppColor.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: 'Thin crust',
                            size: 20,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PrimaryText(
                            text: 'Delivery in',
                            size: 18,
                            color: AppColor.lightGray,
                            fontWeight: FontWeight.w500,
                          ),
                          PrimaryText(
                            text: '30 min',
                            size: 20,
                            color: AppColor.black,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [BoxShadow(color: AppColor.lightGray)]),
                        child: Hero(
                          tag: imagePath ?? '',
                          child: Image.asset(
                            imagePath ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const PrimaryText(
                    text: 'Ingredients',
                    fontWeight: FontWeight.w700,
                    size: 22,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                /// Fetch ingredients image from const file
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ingredients.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                          child:
                              ingredientsCard(ingredients[index]['imagePath']));
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


