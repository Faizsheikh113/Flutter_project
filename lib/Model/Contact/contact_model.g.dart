// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) =>
    _ContactResponse(
      id: json['id'] as String? ?? "",
      done: json['done'] as bool? ?? false,
      records:
          (json['records'] as List<dynamic>?)
              ?.map((e) => Contact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ContactResponseToJson(_ContactResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'done': instance.done,
      'records': instance.records,
    };

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  id: json['Id'] as String?,
  email: json['Email'] as String? ?? '',
  firstName: json['FirstName'] as String? ?? '',
  lastName: json['LastName'] as String? ?? '',
  salutation: json['Salutation'] as String? ?? '',
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'Id': instance.id,
  'Email': instance.email,
  'FirstName': instance.firstName,
  'LastName': instance.lastName,
  'Salutation': instance.salutation,
};
