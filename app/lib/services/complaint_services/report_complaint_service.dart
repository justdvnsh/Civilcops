import 'package:civilcops/business_logic/models/complaints.dart';
import 'package:civilcops/business_logic/models/user.dart';

abstract class ReportComplaintService {
  Future<List> reportComplaint({Complaint complaint, User user});
}