class StudentModel {
  String id;
  String name;
  String rollNo;
  String age;
  String department;
  String phone;
  String? image;

  StudentModel(
      {required this.id,
      required this.name,
      required this.rollNo,
      required this.age,
      required this.department,
      required this.phone,
      this.image});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      rollNo: json['roll_no'],
      age: json['age'],
      department: json['department'],
      phone: json['phone'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'roll_no': rollNo,
      'age': age,
      'department': department,
      'phone': phone,
      'image': image
    };
  }

  StudentModel copyWith(
      {String? name,
      String? rollno,
      String? age,
      String? department,
      String? phone}) {
    return StudentModel(
        id: id,
        name: name ?? this.name,
        rollNo: rollno ?? this.rollNo,
        age: age ?? this.age,
        department: department ?? this.department,
        phone: phone ?? this.phone);
  }
}
