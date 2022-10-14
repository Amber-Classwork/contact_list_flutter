class Contact {
  final String id;
  final String first_name;
  final String last_name;
  final String email;
  final int contact_num;
  final String thumbnail;

  const Contact({required this.first_name, required this.last_name, required this.contact_num, required this.email, required this.id,required this.thumbnail});

  factory Contact.fromJson(Map<String, dynamic> json){
    return Contact(
      id: json['_id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      email: json['email'],
      thumbnail: json['thumbnail'],
      contact_num: json['contact_num'],
    );
  }
}
