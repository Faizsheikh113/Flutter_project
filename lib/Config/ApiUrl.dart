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
      '00DgL000000R4Ip!AQEAQA99eGkRBXeQUHmz5nA.ZxhmRV7TtgmVpoKtOoAl2S1golMeVhhdzZwHBKGK5MLYYp6OPHomfLQLwxRT1Y4LtxHDHOSU';
}
