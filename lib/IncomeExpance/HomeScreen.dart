import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/DB_Helper.dart';
import 'Category.dart';
import 'HomeControler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    addControllor.ReadData();
    addControllor.totalData();
    addControllor.date.value =
        "${addControllor.now.day}/${addControllor.now.month}/${addControllor.now.year}";
  }

  AddControllor addControllor = Get.put(
    AddControllor(),
  );
  TextEditingController idu = TextEditingController();
  TextEditingController PNameu = TextEditingController();
  TextEditingController Ppriceu = TextEditingController();
  TextEditingController Ptypeu = TextEditingController();
  TextEditingController Pnoteu = TextEditingController();
  TextEditingController Pdateu = TextEditingController(
      text:
          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController Ptimeu = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  TextEditingController Pstastusu = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Container(
            height: double.infinity,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 125,
                    ),
                    Text(
                      "B A L A N C E",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                     IconButton(
                         onPressed: () {
                           showModalBottomSheet(
                             isScrollControlled: true,
                             context: context,
                             backgroundColor: Colors.grey.shade400,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(
                                 topLeft: Radius.circular(20),
                                 topRight: Radius.circular(20),
                               ),
                             ),
                             builder: (context) {
                               return Padding(
                                 padding: EdgeInsets.symmetric(
                                   horizontal: 30,
                                   vertical: 15,
                                 ),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     Center(
                                       child: Icon(
                                         Icons.filter_alt,
                                         size: 40,
                                         color: Colors.black,
                                       ),
                                     ),
                                     SizedBox(
                                       height: 10,
                                     ),
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.fiber_manual_record,
                                           size: 15,
                                           color: Colors.black,
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Text(
                                           "Income / Expense Filter",
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 18,
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 8,
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         Expanded(
                                           child: InkWell(
                                             onTap: () {
                                               addControllor.ReadData();
                                             },
                                             child: Container(
                                               height: 60,
                                               width: double.infinity,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(15),
                                                 border: Border.all(
                                                   color: Colors.white,
                                                   width: 3,
                                                 ),
                                               ),
                                               alignment: Alignment.center,
                                               child: Text(
                                                 "All",
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 18,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Expanded(
                                           child: InkWell(
                                             onTap: () {
                                               addControllor.filterIncomeExpense(
                                                 status: 0,
                                               );
                                             },
                                             child: Container(
                                               height: 60,
                                               width: double.infinity,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(15),
                                                 border: Border.all(
                                                   color: Colors.white,
                                                   width: 3,
                                                 ),
                                               ),
                                               alignment: Alignment.center,
                                               child: Text(
                                                 "Income",
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 18,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Expanded(
                                           child: InkWell(
                                             onTap: () {
                                               addControllor.filterIncomeExpense(
                                                 status: 1,
                                               );
                                             },
                                             child: Container(
                                               height: 60,
                                               width: double.infinity,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(15),
                                                 border: Border.all(
                                                   color: Colors.white,
                                                   width: 3,
                                                 ),
                                               ),
                                               alignment: Alignment.center,
                                               child: Text(
                                                 "Expense",
                                                 style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold,
                                                   fontSize: 18,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 10,
                                     ),
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.fiber_manual_record,
                                           size: 15,
                                           color: Colors.black,
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Text(
                                           "Date Filter",
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 18,
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 8,
                                     ),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                       children: [
                                         Expanded(
                                           child: InkWell(
                                             onTap: () async {
                                               addControllor
                                                   .filterStartingDateFind!.value =
                                                   await showDatePicker(
                                                     context: context,
                                                     initialDate: DateTime.now(),
                                                     firstDate: DateTime(2000),
                                                     lastDate: DateTime(3000),
                                                     builder: (context, child) {
                                                       return Theme(
                                                         data: Theme.of(context)
                                                             .copyWith(
                                                           colorScheme:
                                                           ColorScheme.light(
                                                             primary: Colors.black,
                                                             onPrimary: Colors.white,
                                                             onSurface: Colors.black,
                                                           ),
                                                           textButtonTheme:
                                                           TextButtonThemeData(
                                                             style: TextButton
                                                                 .styleFrom(
                                                               foregroundColor: Colors
                                                                   .black, // button text color
                                                             ),
                                                           ),
                                                         ),
                                                         child: child!,
                                                       );
                                                     },
                                                   ) ??
                                                       addControllor
                                                           .filterStartingDateFind!
                                                           .value;
                                             },
                                             child: Container(
                                               height: 60,
                                               width: double.infinity,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(15),
                                                 border: Border.all(
                                                   color: Colors.white,
                                                   width: 3,
                                                 ),
                                               ),
                                               alignment: Alignment.center,
                                               child: Obx(
                                                     () =>
                                                     Text(
                                                       "${addControllor.filterStartingDateFind!
                                                           .value.day}/0${addControllor
                                                           .filterStartingDateFind!.value
                                                           .month}/${addControllor
                                                           .filterStartingDateFind!.value.year}",
                                                       style: TextStyle(
                                                         color: Colors.black,
                                                         fontWeight: FontWeight.bold,
                                                         fontSize: 17,
                                                       ),
                                                     ),
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Expanded(
                                           child: InkWell(
                                             onTap: () async {
                                               addControllor
                                                   .filterEndingDateFind!.value =
                                                   await showDatePicker(
                                                     context: context,
                                                     initialDate: DateTime.now(),
                                                     firstDate: DateTime(2000),
                                                     lastDate: DateTime(3000),
                                                     builder: (context, child) {
                                                       return Theme(
                                                         data: Theme.of(context)
                                                             .copyWith(
                                                           colorScheme:
                                                           ColorScheme.light(
                                                             primary: Colors.black,
                                                             onPrimary: Colors.white,
                                                             onSurface: Colors.black,
                                                           ),
                                                           textButtonTheme:
                                                           TextButtonThemeData(
                                                             style: TextButton
                                                                 .styleFrom(
                                                               foregroundColor: Colors
                                                                   .black, // button text color
                                                             ),
                                                           ),
                                                         ),
                                                         child: child!,
                                                       );
                                                     },
                                                   ) ??
                                                       addControllor
                                                           .filterEndingDateFind!.value;
                                             },
                                             child: Container(
                                               height: 60,
                                               width: double.infinity,
                                               decoration: BoxDecoration(
                                                 borderRadius: BorderRadius.circular(15),
                                                 border: Border.all(
                                                   color: Colors.white,
                                                   width: 3,
                                                 ),
                                               ),
                                               alignment: Alignment.center,
                                               child: Obx(
                                                     () =>
                                                     Text(
                                                       "${addControllor.filterEndingDateFind!
                                                           .value.day}/0${addControllor
                                                           .filterEndingDateFind!.value
                                                           .month}/${addControllor
                                                           .filterEndingDateFind!.value.year}",
                                                       style: TextStyle(
                                                         color: Colors.black,
                                                         fontWeight: FontWeight.bold,
                                                         fontSize: 17,
                                                       ),
                                                     ),
                                               ),
                                             ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         InkWell(
                                           onTap: () {
                                             var sd =
                                                 "${addControllor.filterStartingDateFind!.value
                                                 .day}/0${addControllor.filterStartingDateFind!
                                                 .value.month}/${addControllor
                                                 .filterStartingDateFind!.value.year}";
                                             var ed =
                                                 "${addControllor.filterEndingDateFind!.value
                                                 .day}/0${addControllor.filterEndingDateFind!
                                                 .value.month}/${addControllor
                                                 .filterEndingDateFind!.value.year}";
                                             addControllor.filterDate(
                                               startingDate: sd,
                                               endingDate: ed,
                                             );
                                           },
                                           child: Container(
                                             height: 60,
                                             width: 60,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(15),
                                               border: Border.all(
                                                 color: Colors.white,
                                                 width: 3,
                                               ),
                                             ),
                                             alignment: Alignment.center,
                                             child: Icon(
                                               Icons.filter_alt_rounded,
                                               color: Colors.black,
                                               size: 25,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 10,
                                     ),
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.fiber_manual_record,
                                           size: 15,
                                           color: Colors.black,
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Text(
                                           "Category Filter",
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 18,
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 8,
                                     ),
                                     Row(
                                       children: [
                                         Expanded(
                                           child: Obx(
                                                 () =>
                                                 DropdownButtonFormField(
                                                   value:
                                                   addControllor.selectedCategory.value,
                                                   items: addControllor.categoryNameList
                                                       .map(
                                                         (element) =>
                                                         DropdownMenuItem(
                                                           child: Text(element),
                                                           value: element,
                                                         ),
                                                   )
                                                       .toList(),
                                                   onChanged: (value) {
                                                     addControllor.selectedCategory.value = value!;
                                                   },
                                                   icon: Icon(
                                                     Icons.keyboard_arrow_down_outlined,
                                                     color: Colors.black,
                                                   ),
                                                   dropdownColor: Colors.grey.shade400,
                                                   decoration: InputDecoration(
                                                     enabledBorder: OutlineInputBorder(
                                                       borderRadius:
                                                       BorderRadius.circular(15),
                                                       borderSide: BorderSide(
                                                         color: Colors.white,
                                                         width: 3,
                                                       ),
                                                     ),
                                                     focusedBorder: OutlineInputBorder(
                                                       borderRadius:
                                                       BorderRadius.circular(15),
                                                       borderSide: BorderSide(
                                                         color: Colors.white,
                                                         width: 3,
                                                       ),
                                                     ),
                                                   ),
                                                   style: TextStyle(
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 18,
                                                   ),
                                                   borderRadius: BorderRadius.circular(12),
                                                 ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         InkWell(
                                           onTap: () {
                                             addControllor.filterCategory(
                                               addControllor.selectedCategory.value,
                                             );
                                           },
                                           child: Container(
                                             height: 60,
                                             width: 60,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(15),
                                               border: Border.all(
                                                 color: Colors.white,
                                                 width: 3,
                                               ),
                                             ),
                                             alignment: Alignment.center,
                                             child: Icon(
                                               Icons.filter_alt_rounded,
                                               color: Colors.black,
                                               size: 25,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 10,
                                     ),
                                     Row(
                                       children: [
                                         Icon(
                                           Icons.fiber_manual_record,
                                           size: 15,
                                           color: Colors.black,
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         Text(
                                           "PaymentMethod Filter",
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontWeight: FontWeight.bold,
                                             fontSize: 18,
                                           ),
                                         ),
                                       ],
                                     ),
                                     SizedBox(
                                       height: 8,
                                     ),
                                     Row(
                                       children: [
                                         Expanded(
                                           child: Obx(
                                                 () =>
                                                 DropdownButtonFormField(
                                                   value: addControllor
                                                       .selectedPaymentMethod.value,
                                                   items: addControllor.ChangePaymentList
                                                       .map(
                                                         (element) =>
                                                         DropdownMenuItem(
                                                           child: Text(element),
                                                           value: element,
                                                         ),
                                                   )
                                                       .toList(),
                                                   onChanged: (value) {
                                                     addControllor.selectedPaymentMethod
                                                         .value = value!;
                                                   },
                                                   icon: Icon(
                                                     Icons.keyboard_arrow_down_outlined,
                                                     color: Colors.black,
                                                   ),
                                                   dropdownColor: Colors.grey.shade400,
                                                   decoration: InputDecoration(
                                                     enabledBorder: OutlineInputBorder(
                                                       borderRadius:
                                                       BorderRadius.circular(15),
                                                       borderSide: BorderSide(
                                                         color: Colors.white,
                                                         width: 3,
                                                       ),
                                                     ),
                                                     focusedBorder: OutlineInputBorder(
                                                       borderRadius:
                                                       BorderRadius.circular(15),
                                                       borderSide: BorderSide(
                                                         color: Colors.white,
                                                         width: 3,
                                                       ),
                                                     ),
                                                   ),
                                                   style: TextStyle(
                                                     color: Colors.black,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 18,
                                                   ),
                                                   borderRadius: BorderRadius.circular(12),
                                                 ),
                                           ),
                                         ),
                                         SizedBox(
                                           width: 10,
                                         ),
                                         InkWell(
                                           onTap: () {
                                             addControllor.filterPaymentMethod(
                                               addControllor
                                                   .selectedPaymentMethod.value,
                                             );
                                           },
                                           child: Container(
                                             height: 60,
                                             width: 60,
                                             decoration: BoxDecoration(
                                               borderRadius: BorderRadius.circular(15),
                                               border: Border.all(
                                                 color: Colors.white,
                                                 width: 3,
                                               ),
                                             ),
                                             alignment: Alignment.center,
                                             child: Icon(
                                               Icons.filter_alt_rounded,
                                               color: Colors.black,
                                               size: 25,
                                             ),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               );
                             },
                           );
                         }, icon: Icon(Icons.filter_alt_outlined))
                  ],
                ),
                Obx(
                  () => Text(
                    "\$ ${addControllor.DataTotal.value}",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Divider(thickness: 2, color: Colors.black),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: InkWell(
                            onTap: () {
                              addControllor.filterData(Status: 0);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Income',
                                style: TextStyle(color: Colors.grey[500])),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => addControllor.incomeDataTotal[0]
                                          ['total_income'] ==
                                      null
                                  ? Text("00",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold))
                                  : Text(
                                      '\$'
                                      " ${addControllor.incomeDataTotal.value[0]['total_income']}",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            addControllor.filterData(Status: 1);
                            // addControllor.ReadData();
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Row(
                                children: [
                                  Text('Expense',
                                      style:
                                          TextStyle(color: Colors.grey[500])),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => addControllor.expenseDataTotal[0]
                                          ['total_expense'] ==
                                      null
                                  ? Text('' "00",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold))
                                  : Text(
                                      '\$'
                                      " ${addControllor.expenseDataTotal.value[0]['total_expense']}",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Transactions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            addControllor.ReadData();
                          },
                          child: Text("View all")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(7),
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: addControllor.ProductList[index]
                                          ['Status'] ==
                                      0
                                  ? Colors.green.shade100
                                  : Colors.red.shade100,
                            ),
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 2,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  child: addControllor.ProductList[index]
                                              ['Status'] ==
                                          0
                                      ? Icon(
                                          Icons.arrow_upward,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.arrow_downward,
                                          color: Colors.red,
                                        ),
                                  radius: 22,
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Row(children: [
                                          Container(
                                              width: 55,
                                              child: Text(
                                                  "${addControllor.ProductList[index]['Pname']}",
                                                  style: GoogleFonts.poppins(
                                                    color: Color(0xff31435b),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                  ))),
                                          SizedBox(
                                            width: 65,
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                      "${addControllor.ProductList.value[index]['Ptype']}",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                            "${addControllor.ProductList[index]['Pprice']}",
                                            style: GoogleFonts.poppins(
                                              color: Colors.grey,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 10,
                                            )),
                            SizedBox(width: 86,),
                            Text(
                                "${addControllor.ProductList[index]['Pdate']}",
                                style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                )),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        idu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['id']}");
                                        PNameu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['Pname']}");
                                        Ppriceu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['Pprice']}");
                                        Ptypeu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['Ptype']}");
                                        Pdateu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['Pdate']}");
                                        Ptimeu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['Ptime']}");
                                        Pstastusu = TextEditingController(
                                            text:
                                                "${addControllor.ProductList[index]['Status']}");
                                        updateDialog();
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.green,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        addControllor.deleteData(
                                          id: addControllor.ProductList[index]
                                              ['id'],
                                        );
                                        addControllor.ReadData();
                                        addControllor.totalData();
                                      },
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: addControllor.ProductList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: AlertDialog(
                  backgroundColor: Colors.grey.shade400,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Obx(() => Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                      "${addControllor.categoryNameList[addControllor.categoryIndex.value]}"),
                                )),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  addControllor.categorySelected.value = false;
                                  addControllor.categoryIndex.value = 0;
                                  addControllor.PName = TextEditingController(
                                      text:
                                          '${addControllor.categoryNameList[addControllor.categoryIndex.value]}');
                                  showModalBottomSheet(
                                    backgroundColor: Colors.grey.shade400,
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                20)),
                                    builder: (context) {
                                      return CategoryBottomsheet();
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.category,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                        controller: addControllor.Pprice,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          label: Text("Price",
                              style: TextStyle(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                        controller: addControllor.Pnote,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          label: Text("Note",
                              style: TextStyle(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                        controller: addControllor.Ptype,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Obx(
                            () => Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: addControllor.ChangePayment.value,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Offline"),
                                      value: "Offline",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Online"),
                                      value: "Online",
                                    ),
                                  ],
                                  onChanged: (value) {
                                    addControllor.ChangePayment.value = value!;
                                  },
                                ),
                              ),
                            ),
                          ),
                          // label: Text("Payment Type",
                          //     style: TextStyle(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Obx(
                        () => Container(
                          padding: EdgeInsets.all(8),
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                "${addControllor.date.value}",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () async {
                                  DateTime date = (await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2012),
                                    lastDate: DateTime(2122),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: Colors.black,
                                            onPrimary: Colors.white,
                                            onSurface: Colors.black,
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              foregroundColor: Colors
                                                  .black, // button text color
                                            ),
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  ))!;
                                  addControllor.date.value =
                                      "${date.day}/${date.month}/${date.year}";
                                },
                                icon: Icon(
                                  Icons.calendar_month,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      TextField(
                        controller: addControllor.Ptime,
                        cursorColor: Colors.black,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: DateTime.now().hour,
                                        minute: DateTime.now().minute));
                                theme:
                                ThemeData(
                                  textButtonTheme: TextButtonThemeData(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.white),
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.black),
                                      overlayColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Colors.black),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.access_time_rounded,
                                color: Colors.black,
                              )),
                          label: Text(
                            "Time",
                            style: TextStyle(color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Align(alignment: Alignment.bottomCenter, child: IE()),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget IE() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                print(addControllor.PName.text);
                dbHelper dbhelper = dbHelper();
                dbhelper.insertData(
                  // id: addControllor.ProductList[index]["id"],
                  Pname: addControllor
                      .categoryNameList[addControllor.categoryIndex.value],
                  Pprice: addControllor.Pprice.text,
                  Ptype: addControllor.ChangePayment.value,
                  Pdate: addControllor.date.value,
                  Ptime: addControllor.Ptime.text,
                  Status: 0,
                );
                addControllor.ReadData();
                addControllor.totalData();
                Navigator.pop(context);
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('Income',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2)),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                print("=====================================");
                print("${addControllor.ChangePayment.value}");
                dbHelper dbhelper = dbHelper();
                dbhelper.insertData(
                  // id: addControllor.id.text,
                  Pname: addControllor
                      .categoryNameList[addControllor.categoryIndex.value],
                  Pprice: addControllor.Pprice.text,
                  Ptype: addControllor.ChangePayment.value,
                  // Ptype: addControllor.Ptype.value,
                  Pdate: addControllor.date.value,
                  Ptime: addControllor.Ptime.text,
                  Status: 1,
                );
                addControllor.ReadData();
                addControllor.totalData();
                Navigator.pop(context);
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text('Expanse',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateDialog() {
    showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.grey.shade400,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Obx(() => Text(
                        "${addControllor.categoryNameList[addControllor.categoryIndex.value]}")),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          addControllor.categorySelected.value = false;
                          addControllor.categoryIndex.value = 0;
                          addControllor.PName = TextEditingController(
                              text:
                                  '${addControllor.categoryNameList[addControllor.categoryIndex.value]}');
                          showModalBottomSheet(
                            backgroundColor: Colors.grey.shade400,
                            context: context,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadiusDirectional.circular(20)),
                            builder: (context) {
                              return CategoryBottomsheet();
                            },
                          );
                        },
                        icon: Icon(
                          Icons.category,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Ppriceu,
                onChanged: (value) {},
                decoration: InputDecoration(
                  label: Text(
                    "Price",
                    style: TextStyle(color: Colors.black),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: addControllor.Pnote,
                cursorColor: Colors.black,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  label: Text("Note",
                      style: TextStyle(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Ptypeu,
                onChanged: (value) {},
                decoration: InputDecoration(
                  suffixIcon: Obx(
                    () => DropdownButton(
                      value: addControllor.ChangePayment.value,
                      isExpanded: true,
                      items: [
                        DropdownMenuItem(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Offline"),
                          ),
                          value: "Offline",
                        ),
                        DropdownMenuItem(
                          child: Text("Online"),
                          value: "Online",
                        ),
                      ],
                      onChanged: (value) {
                        addControllor.ChangePayment.value = value!;
                      },
                    ),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Pdateu,
                onChanged: (value) {},
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async =>
                        addControllor.current.value = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2012),
                      lastDate: DateTime(2122),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              onSurface: Colors.black,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Colors.black, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                    ))!,
                    icon: Icon(Icons.calendar_month, color: Colors.black),
                  ),
                  label: Text(
                    "date",
                    style: TextStyle(color: Colors.black),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Ptimeu,
                onChanged: (value) {},
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                                hour: DateTime.now().hour,
                                minute: DateTime.now().minute));
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color: Colors.black,
                      )),
                  label: Text(
                    "Time",
                    style: TextStyle(color: Colors.black),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("cancel"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () {
                          addControllor.updateData(
                            id: idu.text,
                            Pname: addControllor.categoryNameList[
                                addControllor.categoryIndex.value],
                            Pprice: Ppriceu.text,
                            Ptype: addControllor.ChangePayment.value,
                            Pdate: addControllor.Pdate.text,
                            Ptime: Ptimeu.text,
                            Status: Pstastusu.text,
                          );
                          addControllor.totalData();

                          Get.back();
                        },
                        child: Text("yes"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
