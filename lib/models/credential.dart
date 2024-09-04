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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["address"] = address;
    data["title"] = title;
    data["userName"] = userName;
    data["hasPassword"] = hasPassword;
    data["passwordStrength"] = passwordStrength;
    data["isLeaked"] = isLeaked;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["siteLogo"] = siteLogo;
    data["email"] = email;
    data["note"] = note;
    return data;
  }
}
