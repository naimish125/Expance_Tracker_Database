import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class dbHelper {
  Database? database;

  Future<Database?> checkDB() async {
    if (database == null) {
      return await createDB();
    } else {
      return database;
    }
  }

  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'incomeexpense.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            'CREATE TABLE incomeexpense (id INTEGER PRIMARY KEY AUTOINCREMENT,Pname TEXT ,Pprice TEXT,Ptype TEXT,Pdate TEXT,Ptime TEXT,Status INTEGER)';
        db.execute(query);
      },
    );
  }

  Future<void> insertData({
    // required  id,
    required Pname,
    required Pprice,
    required Ptype,
    required Pdate,
    required Ptime,
    required Status,
  }) async {
    database = await checkDB();
    database!.insert('incomeexpense', {
      // 'id'   : id,
      'Pname': Pname,
      'Pprice': Pprice,
      'Ptype': Ptype,
      'Pdate': Pdate,
      'Ptime': Ptime,
      'Status': Status,
    });
  }

  Future<List<Map>> ReadData() async {
    database = await checkDB();
    String sql = "SELECT * FROM incomeexpense";
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  Future<void> deleteData({required id}) async {
    database = await checkDB();
    database!.delete("incomeexpense", where: "id=?", whereArgs: [id]);
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
    database = await checkDB();
    database!.update(
        'incomeexpense',
        {
          'id': id,
          'Pname': Pname,
          'Pprice': Pprice,
          'Ptype': Ptype,
          'Pdate': Pdate,
          'Ptime': Ptime,
          'Status': Status,
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  Future<List> FilterData({required Status}) async {
    database = await checkDB();

    String quary = "SELECT * FROM incomeexpense WHERE Status=$Status";
    print(quary);

    List l1 = await database!.rawQuery(quary);
    print(l1);

    print(l1);
    return l1;
  }

  Future<List> calculateIncomeBalance() async {
    database = await checkDB();
    String query =
        "SELECT SUM(Pprice) AS total_income FROM incomeexpense WHERE status = '0'";
    List incomeDataTotal = await database!.rawQuery(query);
    return incomeDataTotal;
  }

  Future<List> calculateExpenseBalance() async {
    database = await checkDB();
    String query =
        "SELECT SUM(Pprice) AS total_expense FROM incomeexpense WHERE status = '1'";
    List expenseDataTotal = await database!.rawQuery(query);
    return expenseDataTotal;
  }
  Future<List<Map>> filterDate({
    required startingDate,
    required endingDate,
  }) async {
    database = await checkDB();
    String query =
        "SELECT * FROM incomeexpense WHERE Pdate >= '$startingDate' AND Pdate <= '$endingDate'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<List<Map>> filterCategory({
    required category,
  }) async {
    database = await checkDB();
    String query = "SELECT * FROM incomeexpense WHERE Pname = '$category'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

  Future<List<Map>> filterPaymentMethod({
    required paymentmethod,
  }) async {
    database = await checkDB();
    String query =
        "SELECT * FROM incomeexpense WHERE Ptype = '$paymentmethod'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }
  Future<List<Map>> filterIncomeExpense({
    required status,
  }) async {
    database = await checkDB();
    String query = "SELECT * FROM incomeexpense WHERE status = '$status'";
    List<Map> dataList = await database!.rawQuery(query);
    return dataList;
  }

}




