class RequestDto {
  static final _instance = RequestDto();
  RequestDto();

  factory RequestDto.static() => _instance;

  Map<String, dynamic> buildData() => {};
}