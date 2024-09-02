
class User {
  String? id;
  String? userid;
  String? name;
  String? email;
  String? phone;
  String? profileUrl;
  String? pin;
  String? isPasswordEnable;
  String? pinType;
  String? recoveryKey;

  User({this.id, this.userid, this.name, this.email, this.phone, this.profileUrl, this.pin, this.isPasswordEnable, this.pinType, this.recoveryKey});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["userid"] is String) {
      userid = json["userid"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["profileUrl"] is String) {
      profileUrl = json["profileUrl"];
    }
    if(json["pin"] is String) {
      pin = json["pin"];
    }
    if(json["isPasswordEnable"] is String) {
      isPasswordEnable = json["isPasswordEnable"];
    }
    if(json["pinType"] is String) {
      pinType = json["pinType"];
    }
    if(json["recoveryKey"] is String) {
      recoveryKey = json["recoveryKey"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["userid"] = userid;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["profileUrl"] = profileUrl;
    _data["pin"] = pin;
    _data["isPasswordEnable"] = isPasswordEnable;
    _data["pinType"] = pinType;
    _data["recoveryKey"] = recoveryKey;
    return _data;
  }
}