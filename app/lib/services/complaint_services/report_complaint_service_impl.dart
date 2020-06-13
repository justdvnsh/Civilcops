import 'dart:convert';

import 'package:civilcops/business_logic/models/user.dart';
import 'package:civilcops/business_logic/models/complaints.dart';
import 'package:civilcops/services/complaint_services/report_complaint_service.dart';
import 'package:http/http.dart' as http;

class ReportComplaintServiceImpl implements ReportComplaintService {
  
  var client = http.Client();
  final String BASE_URL = "http://192.168.1.100:8000/civilcops/api/";
  final result = List();
  String id;

  @override
  Future<List> reportComplaint({Complaint complaint, User user}) async {
    String url = BASE_URL + "registerComplaint/";
    var data = {
      "complaint_identity": complaint.getComplaintIdentity(),
      "concerned_dept": complaint.getConcernedDept(),
      "image_url": complaint.getImageUrl(),
      "description": complaint.getDescription(),
      "attachment_url": complaint.getAttachment(),
      "status": complaint.getStatus(),
      "user_number": user.getMobileNumber()
    };
    http.Response response = await client.post(url, body: data);
    if (response.statusCode == 200) {
      try {
        print(response.body);
        if (json.decode(response.body)["type"] == "Success") {
          id = json.decode(response.body)["id"];
          result.add(id);
          result.add(true);
          print(result.toString());
          return result;
        } else {
          result.add("null");
          result.add(false);
          return result;  
        } 
      } catch(e) {
        print(e);
        result.add("null");
        result.add(false);
        return result;
      }
    } else {
      print(response.statusCode);
      result.add("null");
      result.add(false);
      return result;
    }
  }

}