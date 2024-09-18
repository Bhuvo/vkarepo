class StateModel {
  int? stateId;
  String? stateName;

  StateModel({this.stateId, this.stateName});

  StateModel.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    return data;
  }

  @override
  String toString() {
    return '$stateName';
  }
}
