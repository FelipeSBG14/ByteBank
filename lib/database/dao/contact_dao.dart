import 'package:bytebank_final/database/app_database.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/contact.dart';

class ContactDao{
  
  static final String tableSql = 'CREATE TABLE $_tableName('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)';
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  Map<String, dynamic> contactMap = _toMap(contact);
  return db.insert(_tableName, contactMap);

/*   return getDatabase().then((db) {
    final Map<String, dynamic> contactMap = {};
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  }); */
}

Map<String, dynamic> _toMap(Contact contact) {
  final Map<String, dynamic> contactMap = {};
  contactMap[_name] = contact.name;
  contactMap[_accountNumber] = contact.accountNumber;
  return contactMap;
}

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query(_tableName);
  List<Contact> contacts = _toList(result);
  return contacts;

/*   return getDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> row in maps) {
        final Contact contact = Contact(
          row['id'],
          row['name'],
          row['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  }); */
}

List<Contact> _toList(List<Map<String, dynamic>> result) {
  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row[_id],
      row[_name],
      row[_accountNumber],
    );
    contacts.add(contact);
  }
  return contacts;
}

}