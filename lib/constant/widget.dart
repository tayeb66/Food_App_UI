import 'package:flutter/material.dart';
import '../style.dart';
import '../views/food_detail.dart';
import 'colors.dart';

/// PopularFoodCard on HomePage
Widget popularFoodCard(BuildContext context, String? imagePath, String? name,
    String? weight, String? star) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FoodDetail(
                /// passing image foodDetail page
                    imagePath: imagePath ?? '',
                  )));
    },
    child: Container(
      margin: const EdgeInsets.only(left: 20, top: 25, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.white,
          boxShadow: const [
            BoxShadow(
              color: AppColor.lighterGray,
              blurRadius: 10,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 25),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.star,
                        color: AppColor.primary,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      PrimaryText(
                        text: 'Top of the week',
                        size: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.2,
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: PrimaryText(
                    text: name ?? '',
                    size: 22,
                    color: AppColor.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: PrimaryText(
                    text: weight ?? '',
                    size: 16,
                    color: AppColor.lightGray,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 18),
                      decoration: const BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColor.black,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        PrimaryText(
                          text: star ?? '',
                          color: AppColor.black,
                          fontWeight: FontWeight.w800,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            transform: Matrix4.translationValues(20, 0, 0),
            width: MediaQuery.of(context).size.width / 2.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.lightGray,
                  blurRadius: 10,
                )
              ],
            ),
            child: Image.asset(
              imagePath ?? '',
            ),
          )
        ],
      ),
    ),
  );
}

/// Ingredients Slider on foodDetail page
Widget ingredientsCard(String? imagePath) {
  return Container(
    margin: const EdgeInsets.only(right: 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.white,
        boxShadow: const [
          BoxShadow(
            color: AppColor.lighterGray,
            blurRadius: 20,
          )
        ]),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Image.asset(
        imagePath ?? '',
        width: 90,
        fit: BoxFit.cover,
      ),
    ),
  );
}

/// CustomAppbar on foodDetail page
Widget customAppbar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.lightGray),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.chevron_left_outlined),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.transparent),
          ),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.star,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    ),
  );
}
