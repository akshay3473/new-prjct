// To parse this JSON data, do
//
//     final empdetails = empdetailsFromJson(jsonString);


class Empdetails {
  Empdetails(
    this.company,
    this.description,
    this.employmentType,
    this.id,
    this.location,
    this.position,

  );

  String company;
  String description;
  String employmentType;
  int id;
  String location;
  String position;




  Map<String, dynamic> toJson() => {
    "company": company,
    "description": description,
    "employmentType": employmentType,
    "id": id,
    "location": location,
    "position": position,

  };
}
