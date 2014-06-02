library xdZoneEdit.oauth.google_oauth2_service;

import 'package:angular/angular.dart';
import 'dart:async' show Future;
import "package:google_oauth2_client/google_oauth2_browser.dart";
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_browser.dart' as dnsclient;
import 'package:google_dns_v1beta1_api/dns_v1beta1_api_client.dart';

@NgInjectableService()
class GoogleOauth2Service {


  static final String clientWeb = '795904425230-d777qbrp5vsbbk9jsqegd4ne115vmtgm.apps.googleusercontent.com';
  static final List<String> scopes = [
      'openid',
      'profile',
      dnsclient.Dns.NDEV_CLOUDDNS_READWRITE_SCOPE,
      dnsclient.Dns.CLOUD_PLATFORM_SCOPE
  ];

  //var dns;
  //bool isAuthenticated;
  final auth = new GoogleOAuth2(clientWeb, scopes, autoLogin: true);

  GoogleOauth2Service();


  Future login(){
    //init();
    return auth.login();
  }

  void logout(){
    auth.logout();
  }

  bool get isAuthenticated {
    return auth.token != null;
  }

}