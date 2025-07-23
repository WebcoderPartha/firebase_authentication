import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static String userIdKey = "USERIDKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  setUserID(String Id) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userIdKey, Id);
  }

  setUserName(String userName) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userNameKey, userName);
  }

  setUserEmail(String userEmail) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setString(userEmailKey, userEmail);
  }


  getUserId()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userIdKey);
  }

  getUserName()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userNameKey);
  }

  getUserEmail()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(userEmailKey);
  }


}