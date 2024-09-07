class UserModel {
  String? id;
  String? userid;
  String? name;
  String? email;
  String? phone;
  String? profileUrl;
  String? pin;
  bool? isPasswordEnable;
  String? pinType;
  String? recoveryKey;

  UserModel(
      {this.id,
      this.userid,
      this.name,
      this.email,
      this.phone,
      this.profileUrl,
      this.pin,
      this.isPasswordEnable,
      this.pinType,
      this.recoveryKey});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["userid"] is String) {
      userid = json["userid"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["profileUrl"] is String) {
      profileUrl = json["profileUrl"];
    }
    if (json["pin"] is String) {
      pin = json["pin"];
    }
    if (json["isPasswordEnable"] is bool) {
      isPasswordEnable = json["isPasswordEnable"];
    }
    if (json["pinType"] is String) {
      pinType = json["pinType"];
    }
    if (json["recoveryKey"] is String) {
      recoveryKey = json["recoveryKey"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["userid"] = userid;
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["profileUrl"] = profileUrl;
    data["pin"] = pin;
    data["isPasswordEnable"] = isPasswordEnable;
    data["pinType"] = pinType;
    data["recoveryKey"] = recoveryKey;
    return data;
  }
}
