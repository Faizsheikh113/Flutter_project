import 'package:simple_test_practice/Model/Contact/contact_model.dart';

class ContactResponse {
  final List<Contact>? records;

  ContactResponse({required this.records});

  factory ContactResponse.fromJson(Map<String, dynamic> json) {
    return ContactResponse(
      records: (json['records'] as List<dynamic>?)
          ?.map((item) => Contact.fromJson(item))
          .toList(),
    );
  }
}
