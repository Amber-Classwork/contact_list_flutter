class Contact {
  final String first_name;
  final String last_name;
  final String email;
  final String phone;

  const Contact(
      {required this.first_name,
      required this.last_name,
      required this.phone,
      required this.email});

  factory Contact.fromJSON(Map<String, dynamic> json) {
    var contact = Contact(
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      phone: json['phone'],
    );
    print(contact);
    return contact;
  }
}
