
import 'dart:io';

import 'package:meta/meta.dart';
import 'package:oauth1/oauth1.dart' as oauth1;

class OAuth1 {

  final username;
  final password;

  OAuth1({@required this.username,
    @required this.password});

  var platform = new oauth1.Platform(
      "http://etickets.aspirano.com.my/oauth/initiate?oauth_callback=", // temporary credentials request
      "http://etickets.aspirano.com.my/admin/oauth_authorize",     // resource owner authorization
      "http://etickets.aspirano.com.my/oauth/token",  // token credentials request
      oauth1.SignatureMethods.PLAINTEXT            // signature method
  );

  // define client credentials (consumer keys)
  final String apiKey = "4536a8c9c7e2cb8a63fd457cb3076018";
  final String apiSecret = "bd2d6b6bdacf3178ed4580b45f5f6d06";

   authorize(){
    var clientCredentials = new oauth1.ClientCredentials(apiKey, apiSecret);

    // create Authorization object with client credentials and platform definition
    var auth = new oauth1.Authorization(clientCredentials, platform);

    // request temporary credentials (request tokens)
    auth.requestTemporaryCredentials("http://etickets.aspirano.com.my/oauth_admin.php").then((res) {
      // redirect to authorization page
      print("Open with your browser: ${auth.getResourceOwnerAuthorizationURI(res.credentials.token)}");


      // get verifier (PIN)
      stdout.write("PIN: ");
      String verifier = stdin.readLineSync();


      // request token credentials (access tokens)
      return auth.requestTokenCredentials(res.credentials, verifier);
    }).then((res) {
      // yeah, you got token credentials
      // create Client object
      var client = new oauth1.Client(platform.signatureMethod, clientCredentials, res.credentials);

      // now you can access to protected resources via client
      var response = client.get('http://etickets.aspirano.com.my/protected-resources.txt').then((res) {
        print(res.body);
      });

      // NOTE: you can get optional values from AuthorizationResponse object
//      print("Your screen name is " + res.optionalParameters['screen_name']);
    });
  }
}