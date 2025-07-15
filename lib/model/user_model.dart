class PatientModel {
  int? id;
  String? name;
  String? lastName;
  String? dob;
  int? age;
  String? gender;
  String? createdAt;
  String? mobile;
  String? email;
  String? refereByDoctor;
  String? consultant;
  int? totalAmount;
  int? paidAmount;
  int? balanceAmount;
  String? discount;
  int? otherAmount;
  Null? remark;
  String? testList;

  PatientModel(
      {this.id,
        this.name,
        this.lastName,
        this.dob,
        this.age,
        this.gender,
        this.createdAt,
        this.mobile,
        this.email,
        this.refereByDoctor,
        this.consultant,
        this.totalAmount,
        this.paidAmount,
        this.balanceAmount,
        this.discount,
        this.otherAmount,
        this.remark,
        this.testList});

  PatientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    dob = json['dob'];
    age = json['age'];
    gender = json['gender'];
    createdAt = json['created_at'];
    mobile = json['mobile'];
    email = json['email'];
    refereByDoctor = json['refere_by_doctor'];
    consultant = json['consultant'];
    totalAmount = json['total_amount'];
    paidAmount = json['paid_amount'];
    balanceAmount = json['balance_amount'];
    discount = json['discount'];
    otherAmount = json['other_amount'];
    remark = json['remark'];
    testList = json['test_list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['gender'] = this.gender;
    data['created_at'] = this.createdAt;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['refere_by_doctor'] = this.refereByDoctor;
    data['consultant'] = this.consultant;
    data['total_amount'] = this.totalAmount;
    data['paid_amount'] = this.paidAmount;
    data['balance_amount'] = this.balanceAmount;
    data['discount'] = this.discount;
    data['other_amount'] = this.otherAmount;
    data['remark'] = this.remark;
    data['test_list'] = this.testList;
    return data;
  }
}
