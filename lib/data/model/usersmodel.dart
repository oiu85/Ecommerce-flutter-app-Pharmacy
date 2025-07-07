class UsersModel {
  int? usersId;
  String? usersName;
  String? usersPassword;
  String? usersEmail;
  String? usersPhone;
  int? usersVerfiycode;
  int? usersApprove;
  String? useresCreate;

  UsersModel(
      {this.usersId,
        this.usersName,
        this.usersPassword,
        this.usersEmail,
        this.usersPhone,
        this.usersVerfiycode,
        this.usersApprove,
        this.useresCreate});

  UsersModel.fromJson(Map<String, dynamic> json) {
    usersId = json['users_id'];
    usersName = json['users_name'];
    usersPassword = json['users_password'];
    usersEmail = json['users_email'];
    usersPhone = json['users_phone'];
    usersVerfiycode = json['users_verfiycode'];
    usersApprove = json['users_approve'];
    useresCreate = json['useres_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_id'] = usersId;
    data['users_name'] = usersName;
    data['users_password'] = usersPassword;
    data['users_email'] = usersEmail;
    data['users_phone'] = usersPhone;
    data['users_verfiycode'] = usersVerfiycode;
    data['users_approve'] = usersApprove;
    data['useres_create'] = useresCreate;
    return data;
  }
}