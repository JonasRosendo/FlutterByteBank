import 'package:byte_bank/database/dao/contact_dao.dart';
import 'package:byte_bank/models/contact.dart';
import 'package:byte_bank/screens/contact_form.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact>? contacts = snapshot.data;
              return ListView.builder(
                itemCount: contacts?.length,
                itemBuilder: (context, index) {
                  final contact = contacts?[index];
                  return _ContactItem(contact!);
                },
              );
          }

          return const Text("Unknown error");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => const ContactForm(),
            ),
          ).then(
            (contact) {
              setState(() {
                widget.createState();
              });
            },
          )
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  const _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: const TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
