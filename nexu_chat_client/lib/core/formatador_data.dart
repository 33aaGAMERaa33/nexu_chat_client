enum Language{
  ptBr,
}
String formatarData(DateTime data, {Language tipo = Language.ptBr, String separador = "/"}){
  return "${data.day}$separador${data.month}$separador${data.year}";
}