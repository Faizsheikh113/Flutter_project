import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

// ✅ ContactResponse Model
@freezed
abstract class ContactResponse with _$ContactResponse {
  factory ContactResponse({
    @Default("") @JsonKey(name: "id") String id,
    @Default(false) bool done,
    @Default([]) @JsonKey(name: 'records') List<Contact> records,
  }) = _ContactResponse;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}

// ✅ Contact Model
@freezed
abstract class Contact with _$Contact {
  factory Contact({
    @JsonKey(name: 'Id') String? id,
    @JsonKey(name: 'Email') @Default('') String email,
    @JsonKey(name: 'FirstName') @Default('') String firstName,
    @JsonKey(name: 'LastName') @Default('') String lastName,
    @JsonKey(name: 'Salutation') @Default('') String salutation,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
