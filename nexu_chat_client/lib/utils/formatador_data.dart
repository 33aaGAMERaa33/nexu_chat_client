enum Language{
  ptBr,
}
String formatarData(DateTime ? data, {Language tipo = Language.ptBr, String separador = "/"}){
  if(data == null) return "NULO";
  return "${data.day}$separador${data.month}$separador${data.year}";
}