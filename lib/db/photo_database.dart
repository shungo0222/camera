// Package imports:
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

// Project imports:
import '../model/photo.dart';

class PhotoDatabase {
  static final PhotoDatabase instance = PhotoDatabase._init();

  static Database? _database;

  PhotoDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('photos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const blobType = 'BLOB NOT NULL';
    const textType = 'TEXT NOT NULL';
    const realType = 'REAL NOT NULL';

    await db.execute('''CREATE TABLE $tablePhotos (
        ${PhotoFields.id} $idType,
        ${PhotoFields.data} $blobType,
        ${PhotoFields.time} $textType,
        ${PhotoFields.latitude} $realType,
        ${PhotoFields.longitude} $realType
      )''');
  }

  Future<Photo> create(Photo photo) async {
    final db = await instance.database;
    final id = await db.insert(
      tablePhotos,
      photo.toJson(),
    );
    return photo.copy(id: id);
  }

  Future<Photo> readPhoto(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tablePhotos,
      columns: PhotoFields.values,
      where: '${PhotoFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Photo.fromJson(maps.first);
    } else {
      throw Exception('ID $id is not found');
    }
  }

  Future<List<Photo>> readAllPhotos() async {
    final db = await instance.database;

    const orderBy = '${PhotoFields.time} ASC';
    final result = await db.query(
      tablePhotos,
      orderBy: orderBy,
    );
    return result.map((json) => Photo.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tablePhotos,
      where: '${PhotoFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
