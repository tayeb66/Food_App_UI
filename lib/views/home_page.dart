import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ap_ui/constant/colors.dart';
import 'package:food_ap_ui/style.dart';

import '../constant/const.dart';
import '../constant/widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedCatagoryCard = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/man.jpeg'),
            radius: 22,
          ),
        ),
        backgroundColor: AppColor.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/images/menu.svg'))
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                PrimaryText(
                  text: 'Food',
                  size: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColor.black,
                ),
                PrimaryText(
                  text: 'Delivery',
                  size: 50,
                  fontWeight: FontWeight.w800,
                  color: AppColor.black,
                  height: 1.1,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: AppColor.secondary,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColor.lightGray, width: 2.0))),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: PrimaryText(
              text: 'Categories',
              size: 22,
              color: AppColor.black,
              fontWeight: FontWeight.w800,
            ),
          ),

          /// Fetch Categories item info from const file
          SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodCategoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
                  child: foodCatagoryCard(foodCategoryList[index]['imagePath'],
                      foodCategoryList[index]['name'], index),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: PrimaryText(
              text: 'Popular',
              size: 22,
              color: AppColor.black,
              fontWeight: FontWeight.w800,
            ),
          ),

          /// Fetch Popular item info from const file
          Column(
              children: List.generate(
                  popularFoodList.length,
                      (index) => popularFoodCard(
                      context,
                      popularFoodList[index]['imagePath'],
                      popularFoodList[index]['name'],
                      popularFoodList[index]['weight'],
                      popularFoodList[index]['star'])))
        ],
      ),
    );
  }

  Widget foodCatagoryCard(String? imagePath, String? name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(() => {selectedCatagoryCard = index})
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 20, top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: selectedCatagoryCard == index
                ? AppColor.primary
                : AppColor.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: AppColor.lighterGray,
                blurRadius: 10,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              imagePath ?? '',
              width: 45,
            ),
            PrimaryText(
              text: name ?? '',
              size: 20,
              fontWeight: FontWeight.w700,
            ),
            RawMaterialButton(
              onPressed: () {},
              fillColor: selectedCatagoryCard == index
                  ? AppColor.white
                  : AppColor.tertiary,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.chevron_right,
                color: AppColor.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
