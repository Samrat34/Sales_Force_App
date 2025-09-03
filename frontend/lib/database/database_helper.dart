import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sales_force_app/models/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sales_force_app.db');
    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  // Reset database (delete old DB) - for development/testing
  Future<void> resetDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'sales_force_app.db');
    await deleteDatabase(path);
    _database = null;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        role TEXT NOT NULL
      )
    ''');

    // Insert default users
    await db.insert('users', {
      'name': 'Super Admin',
      'email': 'admin@test.com',
      'password': '123456',
      'role': 'super_admin'
    });
    await db.insert('users', {
      'name': 'Client User',
      'email': 'client@test.com',
      'password': '123456',
      'role': 'client'
    });
    await db.insert('users', {
      'name': 'Employee User',
      'email': 'employee@test.com',
      'password': '123456',
      'role': 'employee'
    });
    await db.insert('users', {
      'name': 'Customer User',
      'email': 'customer@test.com',
      'password': '123456',
      'role': 'customer'
    });
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute(
          "ALTER TABLE users ADD COLUMN role TEXT NOT NULL DEFAULT 'customer'");

      // Update existing records with default role
      await db.update('users', {'role': 'customer'});
    }
  }

  // Insert a new user
  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert('users', user.toMap());
  }

  // Get a user by email
  Future<User?> getUserByEmail(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email.trim()],
    );

    if (maps.isNotEmpty) return User.fromMap(maps.first);
    return null;
  }

  // Get a user by ID
  Future<User?> getUserById(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) return User.fromMap(maps.first);
    return null;
  }

  // Verify user credentials and return User if valid
  Future<User?> verifyUser(String email, String password) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.trim(), password.trim()],
    );

    if (maps.isNotEmpty) return User.fromMap(maps.first);
    return null;
  }

  // Get all users (for debugging)
  Future<List<User>> getUsers() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('users');
    return maps.map((m) => User.fromMap(m)).toList();
  }

  // Update a user
  Future<int> updateUser(User user) async {
    Database db = await database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete a user
  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Check if email already exists
  Future<bool> emailExists(String email) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email.trim()],
    );
    return maps.isNotEmpty;
  }
}
