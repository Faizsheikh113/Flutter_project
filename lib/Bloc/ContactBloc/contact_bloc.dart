import 'package:flutter/material.dart';
import 'package:simple_test_practice/Config/ApiUrl.dart';
import 'package:simple_test_practice/Model/Contact/contact_model.dart';
import 'package:simple_test_practice/Repository/ContactRepo/contact_repositery.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvents, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc({required this.contactRepository}) : super(const ContactState()) {
    // Handle Create Contact Events
    on<ContactEmailChanged>(_onEmailChanged);
    on<FirstNameChanged>(_onFirstNameChanged);
    on<LastNameChanged>(_onLastNameChanged);
    on<SalutationChanged>(_onSalutationChanged);
    on<ContactButtonEvent>(_onSubmitContact);

    // Handle CRUD Events
    on<FetchContactListEvent>(
      _onFetchContacts as EventHandler<FetchContactListEvent, ContactState>,
    );
    on<FetchSingleContactEvent>(
      _onFetchSingleContacts
          as EventHandler<FetchSingleContactEvent, ContactState>,
    );
    on<UpdateContactEvent>(_onUpdateContact);
    on<DeleteContactEvent>(_onDeleteContact);
  }

  // Update State for Email
  void _onEmailChanged(ContactEmailChanged event, Emitter<ContactState> emit) {
    emit(state.copyWith(email: event.email));
  }

  // Update State for First Name
  void _onFirstNameChanged(FirstNameChanged event, Emitter<ContactState> emit) {
    emit(state.copyWith(firstName: event.firstname));
  }

  // Update State for Last Name
  void _onLastNameChanged(LastNameChanged event, Emitter<ContactState> emit) {
    emit(state.copyWith(lastName: event.lastname));
  }

  // Update State for Salutation
  void _onSalutationChanged(
    SalutationChanged event,
    Emitter<ContactState> emit,
  ) {
    emit(state.copyWith(salutation: event.salutation));
  }

  // 🟢 Create Contact (Optimized without refetching)
  Future<void> _onSubmitContact(
    ContactButtonEvent event,
    Emitter<ContactState> emit,
  ) async {
    emit(state.copyWith(contactApiStatus: ContactApiStatus.loading));

    try {
      final newContact = Contact(
        email: state.email,
        firstName: state.firstName,
        lastName: state.lastName,
        salutation: state.salutation,
      );

      final createdContactResponse = await contactRepository.contactApi(
        newContact,
        Apiurl.ApiToken,
      );

      if (createdContactResponse.records.isNotEmpty) {
        final newContact = createdContactResponse.records.first;

        // ✅ Update local cache by adding the new contact
        final updatedContactList = List<Contact>.from(state.contactList);
        updatedContactList.add(newContact);

        emit(
          state.copyWith(
            contactList: updatedContactList, // Updated local list
            message: 'Contact Created Successfully!',
            contactApiStatus: ContactApiStatus.success,
            shouldFetch: false, // ❌ No need to refetch
          ),
        );

        print("🟢 Contact Added: ${newContact.toJson()}");
      } else {
        final updatedContactList = List<Contact>.from(state.contactList);
        updatedContactList.add(newContact);

        emit(
          state.copyWith(
            contactList: updatedContactList, // Updated local list
            message: 'Contact Created Successfully!',
            contactApiStatus: ContactApiStatus.success,
          ),
        );
      }
    } catch (error) {
      print("🔴 Error during contact creation: $error");
      emit(
        state.copyWith(
          message: '❌ Error: $error',
          contactApiStatus: ContactApiStatus.failure,
        ),
      );
    }
  }

  Future<void> _onFetchContacts(
    FetchContactListEvent event,
    Emitter<ContactState> emit,
  ) async {
    // ✅ If data is already fetched, use cache and return
    print(
      "Fetch Contact method Called-----------------------------------------",
    );
    if (!state.shouldFetch) {
      print("⏳ Using cached contacts, no API call needed.");
      emit(
        state.copyWith(
          // contactList: updatedContactList,
          contactApiStatus: ContactApiStatus.success,
        ),
      );
      return;
    }

    print("_OnFetchContacts: Fetching from API...");
    emit(state.copyWith(contactApiStatus: ContactApiStatus.loading));

    try {
      final response = await contactRepository.fetchContacts(Apiurl.ApiToken);

      if (response.isNotEmpty) {
        emit(
          state.copyWith(
            contactList: response,
            contactApiStatus: ContactApiStatus.success,
            shouldFetch: false, // ✅ Cache the data to prevent re-fetching
          ),
        );
      } else {
        throw Exception('Failed to fetch contacts');
      }
    } catch (error) {
      emit(
        state.copyWith(
          message: '❌ Error fetching contacts: $error',
          contactApiStatus: ContactApiStatus.failure,
        ),
      );
    }
  }

  Future<void> _onFetchSingleContacts(
    FetchSingleContactEvent event,
    Emitter<ContactState> emit,
  ) async {
    // ✅ If data is already fetched, use cache and return
    print(
      "Fetch Single Contact method Called-----------------------------------------",
    );
    print("_OnFetchSingelContacts: Fetching from API...");
    emit(state.copyWith(contactApiStatus: ContactApiStatus.loading));

    try {
      final response = await contactRepository.getContactById(
        event.contactId,
        Apiurl.ApiToken,
      );

      if (response.isNotEmpty) {
        emit(
          state.copyWith(
            contactList: response,
            contactApiStatus: ContactApiStatus.success,
            shouldFetch: false,
          ),
        );
      } else {
        throw Exception('Failed to fetch contacts');
      }
    } catch (error) {
      emit(
        state.copyWith(
          message: '❌ Error fetching contacts: $error',
          contactApiStatus: ContactApiStatus.failure,
        ),
      );
    }
  }

  // 🟡 Update Contact (Optimized without refetching)
  Future<void> _onUpdateContact(
    UpdateContactEvent event,
    Emitter<ContactState> emit,
  ) async {
    emit(state.copyWith(contactApiStatus: ContactApiStatus.loading));

    try {
      await contactRepository.updateContact(
        event.contactId,
        event.updatedContact,
        Apiurl.ApiToken,
      );

      // ✅ Update the local cache (Modify the contact in the list)
      final updatedContactList =
          state.contactList.map((contact) {
            return contact.id == event.contactId
                ? event.updatedContact
                : contact;
          }).toList();

      emit(
        state.copyWith(
          contactList: updatedContactList, // Updated local list
          message: '✅ Contact Updated Successfully!',
          contactApiStatus: ContactApiStatus.success,
        ),
      );

      print("🟢 Contact Updated: ${event.updatedContact.toJson()}");
    } catch (error) {
      emit(
        state.copyWith(
          message: '❌ Error updating contact: $error',
          contactApiStatus: ContactApiStatus.failure,
        ),
      );
    }
  }

  // 🔴 Delete Contact (Optimized without refetching)
  Future<void> _onDeleteContact(
    DeleteContactEvent event,
    Emitter<ContactState> emit,
  ) async {
    emit(state.copyWith(contactApiStatus: ContactApiStatus.loading));

    try {
      // Step 1: Delete from Salesforce
      await contactRepository.deleteContact(
        event.contactId,
        Apiurl.ApiToken,
        event.context,
      );

      final updatedContactList =
          state.contactList
              .where((contact) => contact.id != event.contactId)
              .toList();

      emit(
        state.copyWith(
          contactList: updatedContactList,
          message: 'Contact Deleted Successfully!',
          contactApiStatus: ContactApiStatus.success,
        ),
      );
    } catch (error) {
      print("❌ Error while deleting: $error");

      emit(
        state.copyWith(
          message: error.toString(),
          contactApiStatus: ContactApiStatus.failure,
        ),
      );
    }
  }
}
