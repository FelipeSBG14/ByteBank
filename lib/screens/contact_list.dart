import 'package:bytebank_final/components/progress.dart';
import 'package:bytebank_final/database/dao/contact_dao.dart';
import 'package:bytebank_final/models/contact.dart';
import 'package:bytebank_final/screens/contact_form.dart';
import 'package:bytebank_final/screens/transaction_form.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transfer'),
        ),
        body: FutureBuilder<List<Contact>>(
          initialData: [],
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress('Loading');
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data! as List<Contact>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = contacts[index];
                    return _ContactItem(contact, () {
                      print('cliquei');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TransactionForm(contact),
                        ),
                      );
                    });
                  },
                  itemCount: contacts.length,
                );
                break;
            }
            return Text('Unknown error');
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ContactForm(),
            ));
          },
          child: Icon(
            Icons.add,
          ),
        ));
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;
  _ContactItem(this.contact, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          onClick();
        },
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
