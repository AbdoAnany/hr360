// To parse this JSON data, do
//
//     final settingsModel = settingsModelFromJson(jsonString);



class SettingsModel {
  SettingsModel({
    required this.name,
    required this.terms,
    required this.aboutUs,
    required this.androidVersion,
    required this.iosVersion,
    required this.androidUrl,
    required this.iosUrl,
    required this.loginPage,
    required this.logo,
  });

  final String name;
  final String terms;
  final String aboutUs;
  final String androidVersion;
  final String iosVersion;
  final String androidUrl;
  final String iosUrl;
  final String loginPage;
  final Logo? logo;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        name: json["name"] == null ? null : json["name"],
        terms: json["terms"] == null ? null : json["terms"],
        aboutUs: json["about_us"] == null ? null : json["about_us"],
        androidVersion:
            json["android_version"] == null ? null : json["android_version"],
        iosVersion: json["ios_version"] == null ? null : json["ios_version"],
        androidUrl: json["android_url"] == null ? null : json["android_url"],
        iosUrl: json["ios_url"] == null ? null : json["ios_url"],
        loginPage: json["login_page"] == null ? null : json["login_page"],
        logo: json["logo"] == null ? null : Logo.fromJson(json["logo"]),
      );
}

class Logo {
  Logo();

  factory Logo.fromJson(Map<String, dynamic> json) => Logo();
}
