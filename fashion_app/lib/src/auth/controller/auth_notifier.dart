import 'dart:convert';

import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/error_modal.dart';
import 'package:fashion_app/src/auth/models/auth_token_model.dart';
import 'package:fashion_app/src/auth/models/profile_model.dart';
import 'package:fashion_app/src/entrypoint/controller/bottom_tab_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthNotifier extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void loginFunction(String data, BuildContext context) async {
    setLoading();

    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/token/login');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: data);
      print(response.body);
      if (response.statusCode == 200) {
        String accessToken = authTokenModelFromJson(response.body).authToken;
        print('accesToken$accessToken');
        Storage().setString('accessToken', accessToken);

        //  Get User Info
        getUser(accessToken, context);

        print('getuser called');
        //TODO Get user extras

        setLoading();
      }
    } catch (e) {
      setLoading();

      if (context.mounted) {
        showErrorPopup(context, AppText.kErrorLogin, e.toString(), false);
      }
    }
  }

  void getUser(String accessToken, BuildContext context) async {
    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/me/');
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $accessToken',
        },
      );
      print('get user function');

      if (response.statusCode == 200) {
        print('user info');

        //  Get User Info

        //TODO Get user extras

        Storage().setString('accessToken', accessToken);
        Storage().setString(accessToken, response.body);

        setLoading();
        context.read<TabIndexNotifier>().setindex(0);
      }
    } catch (e) {
      setLoading();

      showErrorPopup(context, AppText.kErrorLogin, e.toString(), false);
    }
  }

  void registrationFunction(String data, BuildContext context) async {
    setLoading();

    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/');
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: data);
      print(response.body);
      if (response.statusCode == 201) {
        setLoading();

        // setLoading();
      } else if (response.statusCode == 400) {
        setLoading();
        var data = jsonDecode(response.body);

        showErrorPopup(context, data['password'][0], 'Error 400', null);
      } else {
        // setLoading();
      }
    } catch (e) {
      setLoading();

      if (context.mounted) {
        showErrorPopup(context, AppText.kErrorLogin, e.toString(), false);
      }
    }
  }

  ProfileModel? getUserData() {
    String? accessToken = Storage().getString('accessToken');

    if (accessToken != null) {
      var data = Storage().getString(accessToken);

      return profileModelFromJson(data!);
    }
    return null;
  }
}
