T parseEnum<T>(List<T> enums, String stringToEnum){
  for(final enum_ in enums){
    if(enum_.toString().split(".")[1].contains(stringToEnum)){
      return enum_;
    }
  }

  throw Exception("Não foi possivel converter");
}