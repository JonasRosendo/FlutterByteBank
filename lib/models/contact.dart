class Contact {
  int _id;
  String _name;
  int? _accountNumber;

  Contact(this._id, this._name, this._accountNumber);

  get id => _id;
  set id(value) => _id = value;

  get name => _name;
  set name(value) => _name = value;

  get accountNumber => _accountNumber;
  set accountNumber(value) => _accountNumber = value;

  @override
  String toString() {
    return "Contact{id: $id, name: $name, accountNumber: $accountNumber}";
  }
}
