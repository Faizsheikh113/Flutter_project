import 'package:flutter/material.dart';
import 'package:simple_test_practice/Model/Contact/contact_model.dart';

abstract class ContactRepository {
  Future<List<Contact>> fetchContacts(
    String token);
  Future<List<Contact>> getContactById(String id, String token);
  Future<ContactResponse> contactApi(Contact contactModel, String token);
  Future<void> updateContact(String contactId, Contact contact, String token);
  Future<void> deleteContact(String contactId, String token,BuildContext context);
}
