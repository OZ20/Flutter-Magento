import 'dart:io';
import 'package:meta/meta.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class OAuth {

  // This URL is an endpoint that's provided by the authorization server. It's
// usually included in the server's documentation of its OAuth2 API.
  final authorizationEndpoint =
  Uri.parse("http://etickets.aspirano.com.my/oauth/initiate");

  // The authorization server may issue each client a separate client
// identifier and secret, which allows the server to tell which client
// is accessing it. Some servers may also have an anonymous
// identifier/secret pair that any client may use.
//
// Some servers don't require the client to authenticate itself, in which case
// these should be omitted.
  final identifier = "1r9qb7xh4tgvycsffafg9fxumqmp1wva";
  final secret = "fyzkjzpltycg7rn328h05atd3ng6dtbm";

// The user should supply their own username and password.
  final username;
  final password;

  OAuth({@required this.username,
  @required this.password});

  Future<File>authorize()async{
    // Make a request to the authorization endpoint that will produce the fully
// authenticated Client.
    var client = await oauth2.resourceOwnerPasswordGrant(
        authorizationEndpoint, username, password,
        identifier: identifier, secret: secret);

// Once you have the client, you can use it just like any other HTTP client.
    var result = await client.read("http://etickets.aspirano.com.my/protected-resources.txt");
    print(result);

// Once we're done with the client, save the credentials file. This will allow
// us to re-use the credentials and avoid storing the username and password
// directly.
    var file = File("~/.myapp/credentials.json").writeAsString(client.credentials.toJson());
    print(file);

    return file;
  }
}