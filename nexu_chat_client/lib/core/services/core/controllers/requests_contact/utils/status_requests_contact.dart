enum StatusRequestsContact {
  pending,
  accepted,
  rejected;

  String getStatusToString(){
    return toString().split(".")[1];
  }
}

StatusRequestsContact ? stringToStatusRequestsContact(String ? string){
  switch(string){
    case "pending":
      return StatusRequestsContact.pending;
    case "accepted":
      return StatusRequestsContact.accepted;
    case "rejected":
      return StatusRequestsContact.rejected;
    default:
      return null;
  }
}