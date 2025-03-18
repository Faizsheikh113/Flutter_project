class Apiurl {
  // Base URL for Salesforce instance
  static const String _baseUrl =
      "https://orgfarm-735b214413-dev-ed.develop.my.salesforce.com";

  // Authentication API
  static const String loginApi = "https://reqres.in/api/login";

  // External movie list API
  static const String popularMovieList =
      "https://www.episodate.com/api/most-popular?page=1";

  // Fetch Contact List (SOQL Query)
  static const String getContactList =
      "$_baseUrl/services/data/v62.0/query/?q=SELECT+Id,Salutation,FirstName,LastName,Email+FROM+Contact";

  // Create new Contact
  static const String postContact =
      "$_baseUrl/services/data/v62.0/sobjects/Contact";

  // Dynamic Contact URL for update or delete
  static String contactById(String contactId) =>
      "$_baseUrl/services/data/v62.0/sobjects/Contact/$contactId";

  static String ApiToken =
      '00DgL000000R4Ip!AQEAQED.L65Udh.apJ2vnmzqjWF8qf6LdP_2jbfJ.oTMnJoD3R1TO1CFaTPKRGmEIeL7.OaMV6in8FQp_UnYYlb2fp_4iUGz';
}
