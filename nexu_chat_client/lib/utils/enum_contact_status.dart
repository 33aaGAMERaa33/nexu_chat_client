enum ContactStatus{
  active,
  blocked;

  static ContactStatus parse(String string){
    for(final value in ContactStatus.values){
      if(value.toString().split(".")[1].contains(string)){
        return value;
      }
    }

    throw Exception("a");
  }
}

