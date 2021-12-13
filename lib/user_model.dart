

class User {
  int? id;
  String? name;
  String? address;
  String? city;
  String? state;
  String? email;
  String? phone;
  String? companyName;
  String? teamBackground;
  String? companyProducts;
  String? incubationType;
  String? status;
  String? date;

  User(
      {this.id,
        this.name,
        this.address,
        this.city,
        this.state,
        this.email,
        this.phone,
        this.companyName,
        this.teamBackground,
        this.companyProducts,
        this.incubationType,
        this.status,
        this.date});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    email = json['email'];
    phone = json['phone'];
    companyName = json['company_name'];
    teamBackground = json['team_background'];
    companyProducts = json['company_products'];
    incubationType = json['incubation_type'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['email'] = email;
    data['phone'] = phone;
    data['company_name'] = companyName;
    data['team_background'] = teamBackground;
    data['company_products'] = companyProducts;
    data['incubation_type'] = incubationType;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}