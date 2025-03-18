part of 'contact_bloc.dart';

abstract class ContactEvents extends Equatable {
  const ContactEvents();

  @override
  List<Object> get props => [];
}

class ContactEmailChanged extends ContactEvents {
  final String email;
  const ContactEmailChanged(this.email);
}

class FirstNameChanged extends ContactEvents {
  final String firstname;
  const FirstNameChanged(this.firstname);
}

class LastNameChanged extends ContactEvents {
  final String lastname;
  const LastNameChanged(this.lastname);
}

class SalutationChanged extends ContactEvents {
  final String salutation;
  const SalutationChanged(this.salutation);
}

class ContactButtonEvent extends ContactEvents {}


class FetchContactListEvent extends ContactEvents {}

class FetchSingleContactEvent extends ContactEvents {
  final String contactId;
  const FetchSingleContactEvent({required this.contactId});

  @override
  List<Object> get props => [contactId];
}

// For Updating a Contact
class UpdateContactEvent extends ContactEvents {
  final String contactId;
  final BuildContext context; 
  final Contact updatedContact;
  const UpdateContactEvent(this.contactId, this.updatedContact, this.context);

  @override
  List<Object> get props => [contactId, updatedContact];
}

class DeleteContactEvent extends ContactEvents {
  final String contactId;
  final BuildContext context; // Add context
  const DeleteContactEvent(this.contactId, this.context);
}

class ContactLoaded extends ContactState {
  final Contact contact;
  ContactLoaded(this.contact);
}
