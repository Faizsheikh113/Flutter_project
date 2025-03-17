import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_test_practice/Config/ApiUrl.dart';
import 'package:simple_test_practice/Config/Components/FlushBarMessageIndecator.dart';
import 'package:simple_test_practice/Data/Exceptions/Exception_test.dart';
import 'package:simple_test_practice/Data/Network/network_service_api.dart';
import 'package:simple_test_practice/Model/Contact/contact_model.dart';
import 'package:simple_test_practice/Repository/ContactRepo/contact_repositery.dart';

class ContactHttpRepository implements ContactRepository {
  final NetworkServiceApi _api = NetworkServiceApi();
  @override
  Future<List<Contact>> fetchContacts(String token) async {
    print("Fetching Contacts..." + token);
    final response = await _api.getApi(
      Apiurl.getContactList,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    // print("FetchContact :- " + response.toString());

    final contactResponse = ContactResponse.fromJson(response);
    // print("FetchContact :- " + contactResponse.toString());

    // Return only the contact list (Assuming 'records' is the list of contacts)
    return contactResponse.records;
  }

  @override
  Future<ContactResponse> contactApi(Contact contactModel, String token) async {
    print("Creating Contact...");
    final response = await _api.contactpostApi(
      Apiurl.postContact,
      contactModel.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    return ContactResponse.fromJson(response);
  }

  @override
  Future<List<Contact>> getContactById(String contactId, String token) async {
    print("getContactById :- ");
    final url = Apiurl.contactById(contactId);
    final response = await _api.getApi(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    print("FetchSingleContact :- " + response.toString());

    return ContactResponse.fromJson(response).records;
  }

  @override
  Future<void> updateContact(
    String contactId,
    Contact contact,
    String token,
  ) async {
    print("Updating Contact...");
    await _api.putApi(
      Apiurl.contactById(contactId),
      contact.toJson(),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }

  @override
  Future<void> deleteContact(
    String contactId,
    String token,
    BuildContext context,
  ) async {
    final url = Apiurl.contactById(contactId);

    try {
      final response = await _api.deleteApi(
        url,
        contactId,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 204) {
        print("✅ Contact deleted successfully.");

        if (context.mounted) {
          FlushbarIndecator.showSuccess(
            'Contact deleted successfully',
            context,
          );
        }
        return;
      }

      // Parse the error message from the response body
      String errorMessage = 'Failed to delete contact.';
      if (response.statusCode == 400) {
        final List<dynamic> errors = jsonDecode(response.body);
        if (errors.isNotEmpty && errors.first['message'] != null) {
          errorMessage = errors.first['message'];
        }
      }

      throw fetchDataExeption(
        '❌ Delete failed. Status: ${response.statusCode}, Message: $errorMessage',
      );
    } catch (e, stackTrace) {
      print("🚨 Error during delete operation: $e");
      print("📊 Stack Trace: $stackTrace");

      if (context.mounted) {
        FlushbarIndecator.showError(e.toString(), context);
      }
      rethrow;
    }
  }
}
