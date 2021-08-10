import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {

  SharedPreferences prefs;
  
  init() async {
    prefs = await SharedPreferences.getInstance(); 
  }
  
  getUserToken() {
    return prefs.getString("token");
  }

  getPartnerName() {
    return prefs.getString("partner");
  }

  getUserName()  {
    return prefs.getString('name') ?? "";
  }

  getPartnerMail()  {
    return prefs.getString('email') ?? "";
  }

  getLocale()  {
    return prefs.getString('lang') ?? "English";
  }

  getPartnerID()  {
    return prefs.getString('partnerID') ?? "";
  }

  setUserToken(String token)  {
     prefs.setString("token", token);
  }

  setUserName(String token)  {
     prefs.setString("name", token);
  }

  setPartnerName(String name) {
    return prefs.setString("partner", name);
  }

  setPartnerMail(String token)  {
     prefs.setString("email", token);
  }

  setLocale(String lang)  {
     prefs.setString("lang", lang);
  }

  setPartnerID(String partnerID)  {
     prefs.setString("partnerID", partnerID);
  }

}
