class TodoData {
  bool? success;
  List<Data>? data;

  TodoData({this.success, this.data});

  TodoData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? descripiton;
  bool? complated;

  Data(
      {this.sId,
      this.name,
      this.descripiton,
      this.complated,
});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    descripiton = json['descripiton'];
    complated = json['complated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['descripiton'] = this.descripiton;
    data['complated'] = this.complated;
    return data;
  }
}
