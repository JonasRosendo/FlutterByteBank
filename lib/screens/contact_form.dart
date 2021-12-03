import 'package:byte_bank/database/dao/contact_dao.dart';
import 'package:byte_bank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text(
                    "Full name",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            TextField(
              controller: _accountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(
                  "Account Number",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int? account = int.tryParse(_accountController.text);
                    final contact = Contact(0, name, account);
                    _dao.save(contact).then((id) {
                      Navigator.pop(context, contact);
                    });
                  },
                  child: const Text("Create"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
