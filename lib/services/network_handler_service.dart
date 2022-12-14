import 'dart:convert';
import 'dart:io';
import 'secure_store_service.dart';
import 'package:http/http.dart' as http;


// Creates a class to handle requests made
class NetworkHandler {
  static String token = ""; // creating a field variable for token.
  static final client = http.Client();
  static final Map<String, String> _headers ={
    "Content-type": "application/json",
    "Authorization": "Bearer $token"
  };

  // Don't really need a constructor, as we are not instantiating the Helper class

  //Gets token from the SecureStore if it doesn't exist instead of null it will return an empty string.
  static Future<String> getToken(String tokenKey) async {
    String? authToken = await SecureStore.getToken(tokenKey);
    if(authToken == null){
      return Future.value(" ");
    }
    return authToken;
  }


  static Future<String> post(String endpoint, var body) async {
    // Could actually store this in a field variable instead of calling the method for each
    //request
    token = await getToken("jwt-auth");
    http.Response response = await client
        .post(buildUrl(segment: endpoint), body: jsonEncode(body), headers: _headers);
    //Want to check here to see if the response was a success or it failed. status 200 would mean it is.
    // want to facilitate if the response is 201, like when creating an entity
    return _handleResponse(response);

  }

  static Future<String> get({String endpoint = "", Object queryParams = ""}) async {
    token = await getToken("jwt-auth");
    print(_headers);

    var response = await client.get(buildUrl(segment: endpoint), headers: _headers);
    return _handleResponse(response);

  }

  static Future<String> patch(String endpoint, var changes) async {
    token = await getToken("jwt-auth");

    var response = await client.patch(buildUrl(segment: endpoint),
        body: changes,
        headers: _headers);

    return _handleResponse(response);
  }

  static Future<String> put(String endpoint, var changes) async {
    token = await getToken("jwt-auth");

    var response = await client.put(buildUrl(segment: endpoint),
        body: changes,
        headers: _headers);

    return _handleResponse(response);
  }

  static Future<String> delete(String endpoint) async {
    token = await getToken("jwt-auth");

    var response = await client.delete(buildUrl(segment: endpoint), headers: _headers);
    return _handleResponse(response);
  }

  //Here is where the uri is built
  // https://apicontact.fimijm.com/
  static buildUrl({String segment = "", query=""}) {
    Uri uri = Uri(
      scheme: "https",
      host: "apicontact.fimijm.com",
      path: "/api/v1$segment",
      query: query,
    );

    return uri;
  }

//  Create a function to which handles responses. If there is an error or if the response is successfunl
  static String _handleResponse(http.Response response){
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      //  Describe what we should do if there is an error from the server.
      //  Could return a message to the user.
      throw Exception(jsonDecode(response.body)["error"]["message"]);
    }
  }
}
