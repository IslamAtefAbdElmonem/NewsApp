import 'package:flutter/material.dart';
import 'package:project3/category_model.dart';
import 'package:project3/utilties/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoryList = [];
  Function onView;
  CategoryFragment({required this.onView});
  @override
  Widget build(BuildContext context) {
    categoryList = CategoryModel.getCategoryModel(true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: height * 0.02,
        vertical: width * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning \nHere is Some News For You',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemBuilder: (context, index22) {
                return Stack(
                  alignment: index22 % 2 == 0
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        categoryList[index22].imagePath,
                        fit: BoxFit.cover,
                        height: height * 0.2,
                        width: double.infinity,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.02),
                      child: ToggleSwitch(
                        customWidths: [width * 0.35, width * 0.15],
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [AppColors.whiteColor],
                          const [AppColors.greyColor]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        labels: ['True', 'False'],
                        customWidgets: [
                          Text(
                            "View",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const CircleAvatar(
                            backgroundColor: AppColors.blackColor,
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColors.whiteColor,
                            ),
                          )
                        ],
                        radiusStyle: true,
                        onToggle: (index1) {
                          print('switched to: $index22');
                          onView(categoryList[index22]);
                        },
                      ),
                    ),
                  ],
                );
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
