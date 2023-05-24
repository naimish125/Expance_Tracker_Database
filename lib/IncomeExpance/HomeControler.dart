import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/DB_Helper.dart';

class AddControllor extends GetxController {
  TextEditingController id = TextEditingController();
  TextEditingController PName = TextEditingController();
  TextEditingController Pprice = TextEditingController();
  TextEditingController Ptype = TextEditingController();
  TextEditingController Pdate = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController Ptime = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController Pstastus = TextEditingController();

  Rx<DateTime> current = DateTime.now().obs;
  RxList ProductList = <Map>[].obs;
  RxInt categoryIndex = 0.obs;
  RxBool categorySelected = true.obs;
  RxString ChangePayment = "Offline".obs;
  RxInt filter = 2.obs;
  RxInt total = 0.obs;
  RxInt income = 0.obs;
  RxInt expense = 0.obs;
  RxInt Status = 0.obs;

  Future<void> ReadData() async {
    dbHelper dbhelper = dbHelper();

    ProductList.value = await dbhelper.ReadData();
  }

  void deleteData({required id}) {
    dbHelper dbhelper = dbHelper();
    dbhelper.deleteData(id: id);
  }

  Future<void> filterData({required Status}) async {
    dbHelper dbhelper = dbHelper();
    ProductList.value = await dbhelper.FilterData(Status: Status);
  }

  Future<void> updateData({
    required id,
    required Pname,
    required Pprice,
    required Ptype,
    required Pdate,
    required Ptime,
    required Status,
  }) async {
    dbHelper dbhelper = dbHelper();
    dbhelper.updateData(
      id: id,
      Pname: Pname,
      Pprice: Pprice,
      Ptype: Ptype,
      Pdate: Pdate,
      Ptime: Ptime,
      Status: Status,
    );
    ReadData();
  }

  RxList<Icon> categoryIconList = <Icon>[
    Icon(Icons.fastfood, color: Colors.white, size: 22),
    Icon(Icons.games, color: Colors.white, size: 22),
    Icon(Icons.airplanemode_on, color: Colors.white, size: 22),
    Icon(Icons.mobile_friendly_outlined, color: Colors.white, size: 22),
    Icon(Icons.school, color: Colors.white, size: 22),
    Icon(Icons.monetization_on_outlined, color: Colors.white, size: 22),
    Icon(Icons.electrical_services_sharp, color: Colors.white, size: 22),
    Icon(Icons.ev_station_outlined, color: Colors.white, size: 22),
    Icon(Icons.movie_filter, color: Colors.white, size: 22),
  ].obs;

  RxList categoryNameList = [
    'Food',
    'Game',
    'Travel',
    'Recharge',
    'Education',
    'Salary',
    'Bill',
    'Fuel',
    'Movie',
  ].obs;

  RxList<Color> categoryColorList = <Color>[
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ].obs;

  RxList incomeDataTotal = [].obs;
  RxInt DataTotal = 0.obs;

  // Future<List> calculateIncomeBalance() async {
  //   dbHelper dbhelper = dbHelper();
  //   incomeDataTotal.value = await dbhelper.calculateIncomeBalance();
  //   return incomeDataTotal;
  // }

  RxList expenseDataTotal = [].obs;

  //
  // Future<List> calculateExpenseBalance() async {
  //   dbHelper dbhelper = dbHelper();
  //   expenseDataTotal.value = await dbhelper.calculateExpenseBalance();
  //   return expenseDataTotal;
  // }

  void totalData() async {
    dbHelper dbhelper = dbHelper();
    incomeDataTotal.value = await dbhelper.calculateIncomeBalance();
    expenseDataTotal.value = await dbhelper.calculateExpenseBalance();
    DataTotal.value = incomeDataTotal[0]['total_income'] -
        expenseDataTotal[0]['total_expense'];
  }
}