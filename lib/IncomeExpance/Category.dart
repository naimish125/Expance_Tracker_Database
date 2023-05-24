import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomeControler.dart';

class CategoryBottomsheet extends StatelessWidget {
  const CategoryBottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddControllor addControllor = Get.put(AddControllor());
    return Container(
       width: double.infinity,
      height: 350,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 10),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            addControllor.categoryIndex.value = index;
            addControllor.categorySelected.value = true;
            addControllor.ReadData();
            Get.back();
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: addControllor.categoryColorList[index],
                child: addControllor.categoryIconList[index],
              ),
              SizedBox(height: 1,),
              Text('${addControllor.categoryNameList[index]}',style: GoogleFonts.poppins(fontSize: 9)),
            ],
          ),
        ),
        itemCount: 9,
      ),
    );
  }
}