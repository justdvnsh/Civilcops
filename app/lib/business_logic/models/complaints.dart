class Complaint {

  String complaintIdentity;
  String concernedDept;
  String imageUrl;
  String description;
  String attachment;
  String status;
  String userNumber;

  Complaint({this.complaintIdentity, this.concernedDept, this.imageUrl, this.attachment, this.description, this.status, this.userNumber});

  String getComplaintIdentity() {
    return this.complaintIdentity;
  }

  String getConcernedDept() {
    return this.concernedDept;
  }

  String getImageUrl() {
    return this.imageUrl;
  }

  String getDescription() {
    return this.description;
  }

  String getAttachment() {
    return this.attachment;
  }

  String getStatus() {
    return this.status;
  }

  String getUserNumber() {
    return this.userNumber;
  }
}