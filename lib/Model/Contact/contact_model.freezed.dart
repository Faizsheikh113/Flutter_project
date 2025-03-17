// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContactResponse {

@JsonKey(name: "id") String get id; bool get done;@JsonKey(name: 'records') List<Contact> get records;
/// Create a copy of ContactResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactResponseCopyWith<ContactResponse> get copyWith => _$ContactResponseCopyWithImpl<ContactResponse>(this as ContactResponse, _$identity);

  /// Serializes this ContactResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.done, done) || other.done == done)&&const DeepCollectionEquality().equals(other.records, records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,done,const DeepCollectionEquality().hash(records));

@override
String toString() {
  return 'ContactResponse(id: $id, done: $done, records: $records)';
}


}

/// @nodoc
abstract mixin class $ContactResponseCopyWith<$Res>  {
  factory $ContactResponseCopyWith(ContactResponse value, $Res Function(ContactResponse) _then) = _$ContactResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id, bool done,@JsonKey(name: 'records') List<Contact> records
});




}
/// @nodoc
class _$ContactResponseCopyWithImpl<$Res>
    implements $ContactResponseCopyWith<$Res> {
  _$ContactResponseCopyWithImpl(this._self, this._then);

  final ContactResponse _self;
  final $Res Function(ContactResponse) _then;

/// Create a copy of ContactResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? done = null,Object? records = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<Contact>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ContactResponse implements ContactResponse {
   _ContactResponse({@JsonKey(name: "id") this.id = "", this.done = false, @JsonKey(name: 'records') final  List<Contact> records = const []}): _records = records;
  factory _ContactResponse.fromJson(Map<String, dynamic> json) => _$ContactResponseFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey() final  bool done;
 final  List<Contact> _records;
@override@JsonKey(name: 'records') List<Contact> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}


/// Create a copy of ContactResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactResponseCopyWith<_ContactResponse> get copyWith => __$ContactResponseCopyWithImpl<_ContactResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.done, done) || other.done == done)&&const DeepCollectionEquality().equals(other._records, _records));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,done,const DeepCollectionEquality().hash(_records));

@override
String toString() {
  return 'ContactResponse(id: $id, done: $done, records: $records)';
}


}

/// @nodoc
abstract mixin class _$ContactResponseCopyWith<$Res> implements $ContactResponseCopyWith<$Res> {
  factory _$ContactResponseCopyWith(_ContactResponse value, $Res Function(_ContactResponse) _then) = __$ContactResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id, bool done,@JsonKey(name: 'records') List<Contact> records
});




}
/// @nodoc
class __$ContactResponseCopyWithImpl<$Res>
    implements _$ContactResponseCopyWith<$Res> {
  __$ContactResponseCopyWithImpl(this._self, this._then);

  final _ContactResponse _self;
  final $Res Function(_ContactResponse) _then;

/// Create a copy of ContactResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? done = null,Object? records = null,}) {
  return _then(_ContactResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<Contact>,
  ));
}


}


/// @nodoc
mixin _$Contact {

@JsonKey(name: 'Id') String? get id;@JsonKey(name: 'Email') String get email;@JsonKey(name: 'FirstName') String get firstName;@JsonKey(name: 'LastName') String get lastName;@JsonKey(name: 'Salutation') String get salutation;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.salutation, salutation) || other.salutation == salutation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,salutation);

@override
String toString() {
  return 'Contact(id: $id, email: $email, firstName: $firstName, lastName: $lastName, salutation: $salutation)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Id') String? id,@JsonKey(name: 'Email') String email,@JsonKey(name: 'FirstName') String firstName,@JsonKey(name: 'LastName') String lastName,@JsonKey(name: 'Salutation') String salutation
});




}
/// @nodoc
class _$ContactCopyWithImpl<$Res>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = null,Object? firstName = null,Object? lastName = null,Object? salutation = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,salutation: null == salutation ? _self.salutation : salutation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
   _Contact({@JsonKey(name: 'Id') this.id, @JsonKey(name: 'Email') this.email = '', @JsonKey(name: 'FirstName') this.firstName = '', @JsonKey(name: 'LastName') this.lastName = '', @JsonKey(name: 'Salutation') this.salutation = ''});
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

@override@JsonKey(name: 'Id') final  String? id;
@override@JsonKey(name: 'Email') final  String email;
@override@JsonKey(name: 'FirstName') final  String firstName;
@override@JsonKey(name: 'LastName') final  String lastName;
@override@JsonKey(name: 'Salutation') final  String salutation;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactCopyWith<_Contact> get copyWith => __$ContactCopyWithImpl<_Contact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.salutation, salutation) || other.salutation == salutation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,firstName,lastName,salutation);

@override
String toString() {
  return 'Contact(id: $id, email: $email, firstName: $firstName, lastName: $lastName, salutation: $salutation)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Id') String? id,@JsonKey(name: 'Email') String email,@JsonKey(name: 'FirstName') String firstName,@JsonKey(name: 'LastName') String lastName,@JsonKey(name: 'Salutation') String salutation
});




}
/// @nodoc
class __$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = null,Object? firstName = null,Object? lastName = null,Object? salutation = null,}) {
  return _then(_Contact(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,salutation: null == salutation ? _self.salutation : salutation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
