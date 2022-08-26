import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dao/contact_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete, para limpar o banco de dados atualize o valor da verão para um maior e depois volte.
  );
}
