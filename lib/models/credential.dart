class Credential {
  String? id;
  String? address;
  String? title;
  String? userName;
  String? hasPassword;
  String? passwordStrength;
  bool? isLeaked;
  String? createdAt;
  String? updatedAt;
  String? siteLogo;
  String? email;
  String? note;

  Credential(
      {this.id,
      this.address,
      this.title,
      this.userName,
      this.hasPassword,
      this.passwordStrength,
      this.isLeaked,
      this.createdAt,
      this.updatedAt,
      this.siteLogo,
      this.email,
      this.note});

  Credential.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["userName"] is String) {
      userName = json["userName"];
    }
    if (json["hasPassword"] is String) {
      hasPassword = json["hasPassword"];
    }
    if (json["passwordStrength"] is String) {
      passwordStrength = json["passwordStrength"];
    }
    if (json["isLeaked"] is bool) {
      isLeaked = json["isLeaked"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["siteLogo"] is String) {
      siteLogo = json["siteLogo"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["note"] is String) {
      note = json["note"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["address"] = address;
    _data["title"] = title;
    _data["userName"] = userName;
    _data["hasPassword"] = hasPassword;
    _data["passwordStrength"] = passwordStrength;
    _data["isLeaked"] = isLeaked;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["siteLogo"] = siteLogo;
    _data["email"] = email;
    _data["note"] = note;
    return _data;
  }
}
