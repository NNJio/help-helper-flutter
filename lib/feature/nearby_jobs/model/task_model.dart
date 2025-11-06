class JobModel {
  final String type;
  final String time;
  final String date;
  final String location;
  final String price;
  final String status;
  final String icon;
  final bool isAvailable;

  JobModel({
    required this.type,
    required this.time,
    required this.date,
    required this.location,
    required this.price,
    required this.status,
    required this.icon,
    required this.isAvailable,
  });
}
