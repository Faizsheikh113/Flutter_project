part of 'contact_bloc.dart';

enum ContactApiStatus { initial, loading, success, failure }

class ContactState extends Equatable {
  const ContactState({
    this.id = '',
    this.email = '',
    this.firstName = '',
    this.lastName = '',
    this.salutation = '',
    this.message = '',
    this.shouldFetch = true,
    this.contactList = const [],
    this.contactApiStatus = ContactApiStatus.initial,
  });

  // For a single contact (Create, Update, Delete)
  final bool shouldFetch;
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String salutation;

  // For displaying messages (Success/Error)
  final String message;

  // For storing the contact list (Read)
  final List<Contact> contactList;

  // Status of the API call (CRUD Operations)
  final ContactApiStatus contactApiStatus;

  // 🟢 Create a copyWith method for immutability
  ContactState copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    String? salutation,
    String? message,
    bool? shouldFetch,
    List<Contact>? contactList,
    ContactApiStatus? contactApiStatus,
  }) {
    return ContactState(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      salutation: salutation ?? this.salutation,
      message: message ?? this.message,
      shouldFetch: shouldFetch ?? this.shouldFetch,
      contactList: contactList ?? this.contactList,
      contactApiStatus: contactApiStatus ?? this.contactApiStatus,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    firstName,
    lastName,
    salutation,
    message,
    contactList,
    contactApiStatus,
  ];
}