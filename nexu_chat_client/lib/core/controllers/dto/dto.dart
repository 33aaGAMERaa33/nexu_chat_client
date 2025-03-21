class Dto {
  final String status;
  final String message;
  Dto({required this.status, required this.message});

  @override
  String toString() {
    return "status: $status | message: $message";
  }
}