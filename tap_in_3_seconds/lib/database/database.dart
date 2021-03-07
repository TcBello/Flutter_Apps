import 'package:sqflite/sqflite.dart';

class DatabaseService{
  Database database;

  void initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = "$dbPath/leaderboard.db";

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE IF NOT EXISTS Leaderboard(Name TEXT, Score INTEGER)"
        );
      },
    );
  }

  Future<void> insertDataInDatabase(String name, int score) async {
    String dbPath = await getDatabasesPath();
    String path = "$dbPath/leaderboard.db";
    database = await openDatabase(path);

    Map<String, dynamic> mappedValues = {
      "Name": name,
      "Score": score
    };

    database.transaction((txn) => txn.insert(
      "Leaderboard",
      mappedValues
    ));
  }

  Future<List<Map<String, dynamic>>> getLeaderboardInDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = "$dbPath/leaderboard.db";
    database = await openDatabase(path);

    return database.transaction((txn) => txn.query(
      "Leaderboard",
      orderBy: "Score DESC"
    ));
  }
}