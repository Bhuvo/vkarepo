import 'package:flutter/material.dart';
import 'package:timesmedlite/const/consts.dart';
import 'package:timesmedlite/model/patient.dart';
import 'package:timesmedlite/ui/pages/appointment/Clinical%20Visit/book_appointment_clinical_visit.dart';
import 'package:timesmedlite/ui/pages/appointment/Clinical%20Visit/thanking_screen.dart';
import 'package:timesmedlite/ui/pages/appointment/add_appointment_page.dart';
import 'package:timesmedlite/ui/pages/appointment/appointment_patient_details.dart';
import 'package:timesmedlite/ui/pages/appointment/book_appointment_page.dart';
import 'package:timesmedlite/ui/pages/appointment/booking_appointment_page.dart';
import 'package:timesmedlite/ui/pages/appointment/current_appointment.dart';
import 'package:timesmedlite/ui/pages/appointment/in_queue_page.dart';
import 'package:timesmedlite/ui/pages/appointment/in_queue_page_from_connect_to_doctor.dart';
import 'package:timesmedlite/ui/pages/appointment/scheduled_appointment_list.dart';
import 'package:timesmedlite/ui/pages/auth/login_page.dart';
import 'package:timesmedlite/ui/pages/calendar/calendar_page.dart';
import 'package:timesmedlite/ui/pages/call/in_app_call_page.dart';
import 'package:timesmedlite/ui/pages/call/in_app_call_page2.dart';
import 'package:timesmedlite/ui/pages/call/in_app_call_page_focus.dart';
import 'package:timesmedlite/ui/pages/call/update_call_status_page.dart';
import 'package:timesmedlite/ui/pages/call_logs/call_logs_page.dart';
import 'package:timesmedlite/ui/pages/call_logs/missed_call_reschedule.dart';
import 'package:timesmedlite/ui/pages/call_logs/missed_calls_page.dart';
import 'package:timesmedlite/ui/pages/case_sheet/case_sheet.dart';
import 'package:timesmedlite/ui/pages/chat/chat_page.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/clinical_notes_editor.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/clinical_notes_list.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/clinical_notes_view.dart';
import 'package:timesmedlite/ui/pages/clinical_notes/detailed_clinical_notes.dart';
import 'package:timesmedlite/ui/pages/complaints/add_complaints_page.dart';
import 'package:timesmedlite/ui/pages/dashboard/dashboard_page.dart';
import 'package:timesmedlite/ui/pages/demo/demo_flow_select.dart';
import 'package:timesmedlite/ui/pages/demo/routes_page.dart';
import 'package:timesmedlite/ui/pages/doctor/doctor_basic_details.dart';
import 'package:timesmedlite/ui/pages/document/document_preview.dart';
import 'package:timesmedlite/ui/pages/feedback/feedback_page.dart';
import 'package:timesmedlite/ui/pages/hospitals/hospitals_based_on_doctor.dart';
import 'package:timesmedlite/ui/pages/instant_call/instant_doctors_list.dart';
import 'package:timesmedlite/ui/pages/lab_test/lab_test_request.dart';
import 'package:timesmedlite/ui/pages/medical_record/medical_record_details.dart';
import 'package:timesmedlite/ui/pages/medical_record/medical_records_list.dart';
import 'package:timesmedlite/ui/pages/medical_record/upload_medical_doc.dart';
import 'package:timesmedlite/ui/pages/onboard/add_family.dart';
import 'package:timesmedlite/ui/pages/onboard/patient_details_select.dart';
import 'package:timesmedlite/ui/pages/onboard/select_patient_page.dart';
import 'package:timesmedlite/ui/pages/patient_registration/patient_register.dart';
import 'package:timesmedlite/ui/pages/patient_registration/patient_registration_list_page.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_address_form.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_payment_page.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_status_page.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_summary_page.dart';
import 'package:timesmedlite/ui/pages/prescription/order/order_track_page.dart';
import 'package:timesmedlite/ui/pages/prescription/order/orders_list.dart';
import 'package:timesmedlite/ui/pages/prescription/order/prescription_list.dart';
import 'package:timesmedlite/ui/pages/prescription/prescription_editor.dart';
import 'package:timesmedlite/ui/pages/prescription/template/template_list.dart';
import 'package:timesmedlite/ui/pages/profile/patient_account_page.dart';
import 'package:timesmedlite/ui/pages/profile/profile_page_doctor.dart';
import 'package:timesmedlite/ui/pages/schedule/line_list_page.dart';
import 'package:timesmedlite/ui/pages/schedule/schedule_appointment_page.dart';
import 'package:timesmedlite/ui/pages/schedule/schedule_details_page.dart';
import 'package:timesmedlite/ui/pages/schedule/schedule_list_page.dart';
import 'package:timesmedlite/ui/pages/splash/spash_page.dart';
import 'package:timesmedlite/ui/pages/vital_sign/add_vital_sign_page.dart';
import 'package:timesmedlite/ui/pages/vka_patient/add_inr_details.dart';
import 'package:timesmedlite/ui/pages/vka_patient/doctor_add_inr_details.dart';
import 'package:timesmedlite/ui/pages/vka_patient/my_inr_details.dart';
import 'package:timesmedlite/ui/pages/vka_patient/vital.dart';
import 'package:timesmedlite/ui/pages/waiting_list/waiting_list_page.dart';
import 'package:timesmedlite/utils/local_storage.dart';
import '../pages/appointment/Clinical Visit/book_appointment_clinical_timing.dart';
import '../pages/appointment/Clinical Visit/doctors_clinical_details.dart';
import '../pages/appointment/Clinical Visit/doctors_list_for_clinical_visit.dart';
import '../pages/clinical_notes/clinical_notes_add_page.dart';
import '../pages/dashboard/video_dashboard.dart';
import '../pages/instant_call/instant_call_list_dialog.dart';
import '../pages/medical_record/image_overview.dart';
import '../pages/medical_record/medical_record_list_item_from_call_log.dart';
import '../pages/nurse_frontoffice/clinical_appointments.dart';
import '../pages/onboard/add_family_edit_screen.dart';
import '../pages/prescription/Prescription_Preview.dart';
import '../pages/profile/edit_profile_page.dart';
import '../pages/vka_patient/PDFpage.dart';
import '../pages/vka_patient/patient_dashboard.dart';
import '../pages/vka_patient/patient_inr_details_screen.dart';
import 'routes.dart';

abstract class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return route(settings, const SplashPage());
      case Routes.demo:
        return route(settings, const DemoFlowSelect());
      case Routes.login:
        return route(settings, LoginPage());
      case Routes.dashboard:
        return route(settings, DashboardPage());

      case Routes.calendarPage:
        return route(settings, const CalendarPage());
        case Routes.clinicalAppointments:
        return route(settings, const ClinicalAppointments());
      case Routes.patientWaitingList:
        return route(settings, WaitingListPage());
        case Routes.patientApprovelList:
        return route(settings, const InstantCallListDialog());
      case Routes.callLogs:
        return route(settings, CallLogsPage());
      case Routes.missedCalls:
        return route(settings, MissedCallsPage());
      case Routes.pdfVka:
        return route(settings, PDFVKA());
      case Routes.missedCallReschedule:
        args as Map;
        return route(
            settings, MissedCallReschedule(UserData: args['UserData']));
      case Routes.inQueuePage:
        args as Map;
        return route(
            settings, InQueuePage(transactionKey: args['transactionKey']));
      case Routes.inQueuePageFromUpcomingAppointment:
        args as Map;
        return route(
            settings,
            InQueuePageFromUpcomingAppointment(
                appointmentData: args['appointmentData']));
      case Routes.updateCallStatus:
        args as Map;
        return route(
            settings,
            UpdateCallStatusPage(
                appointmentIDFromCallScreen:
                    args['appointmentIDFromCallScreen'],
                currentCallKey: args['currentCallKey'] ,
               isFromClinicalVisit: args['isFromClinicalVisit'] ?? false,
            ));
      case Routes.feedbackPage:
        return route(settings, const FeedbackPage());
      case Routes.patientAccountPage:
        // args as Map;
        return route(
          settings,
          PatientAccountPage(
              // data: args['data'],
              ),
        );
      case Routes.editAccountProfilePage:
        args as Map;
        return route(
            settings,
            EditAccountProfileScreen(
              patientId: args['patientId'],
              Patient_Registration_Number: args['Patient_Registration_Number'],
              First_Name: args['First_Name'],
              Last_Name: args['Last_Name'],
              DOB: args['DOB'],
              Age: args['Age'],
              Gender: args['Gender'],
              Phone_Number: args['Phone_Number'],
              EMail_Id: args['EMail_Id'],
              Password: args['Password'],
              patientImage: args['patientImage'],
              functionToRunBloc: () {},
            ));

      case Routes.inAppCallPage:
        args as Map;
        print(args);
        final token = args['tokenid'];
        final session = args['sessionid'];
        final keyId = args['Key_id'];
        return route(
            settings,
            InCallAppPageFocus(
              token: token,
              session: session,
              keyId: keyId,
              apId: '${args['Appointment_Id'] ?? ''}',
              title: '${args['Doctor_Name'] ?? ''}',
            ));
      case Routes.inAppCallPageDoctor:
        args as Map;
        print(args);
        final token = args['tokenid'];
        final session = args['sessionid'];
        final keyId = args['Key_id'];
        final patID = args['User_Id'];
        return route(
            settings,
            InCallAppPageFocus(
              doctor: true,
              token: token,
              session: session,
              keyId: keyId,
              apId: '${args['Appointment_Id']}',
              title: '${args['User_Name']}',
              patID: patID,
            ));
      case Routes.inAppChatPage:
        return route(settings, const ChatPage());
    case Routes.vital:
        return route(settings, const Vital());

      case Routes.labTestRequest:
        args as Map;
        return route(
            settings,
            LabTestRequest(
              patientid: args['patientid'],
              doctorid: args['doctorid'],
              appointmentid: args['appointmentid'],
            ));
      case Routes.prescriptionEditor:
        args as Map;
        return route(
            settings,
            PrescriptionEditor(
              patientid: args['patientid'],
              doctorid: args['doctorid'],
              appointmentid: args['appointmentid'],
            ));
      case Routes.templateList:
        args as Map;
        return route(
            settings,
            TemplateList(
                patientID: args['patientID'],
                Epharmachy_Masterid: args['Epharmachy_Masterid'],
                already_added_drugs_to_list:
                    args['already_added_drugs_to_list'],
                issaveExisting: args['issaveExisting'] ?? false));
      case Routes.caseSheet:
        args as Map;
        return route(
            settings,
            CaseSheet(
              userId: args['patientID'],
              doctorId: args['doctorId'],
              appointmentId: args['appointmentId'],
              /* doctorID: args['doctorID'],
              userID: args['userID'],
              appointmentID: args['appointmentID'],*/
            ));
      case Routes.vitalSignReport:
        args as Map;
        return route(
            settings,
            AddVitalSignReportPage(
              userId: args['patientID'] ?? LocalStorage.getUser().userId,
              appointmentID: args['appointmentID'],
            ));
      case Routes.clinicalNotesList:
        args as Map;
        return route(
            settings,
            ClinicalNotesList(
              doctorID: args['doctorID'],
              userID: args['userID'],
              appointmentID: args['appointmentID'],
            ));
      case Routes.clinicalNotesAddPage:
        args as Map;
        return route(
            settings,
            ClinicalNotesAddPage(
              doctorID: args['doctorID'],
              userID: args['userID'],
              appointmentID: args['appointmentID'],
            ));
      case Routes.clinicalNotesEditor:
        args as Map;
        return route(
            settings,
            ClinicalNotesEditor(
              data: args['data'],
              doctorID: args['doctorID'],
              userID: args['userID'],
              appointmentID: args['appointmentID'],
            ));
      case Routes.clinicalNotesView:
        return route(settings, const ClinicalNotesView());

      case Routes.BookAnAppointmentClinicalVisit:
        return route(settings, const BookAnAppointmentClinicalVisit());
      case Routes.DoctorsListForClinicalVisit:
        args as Map;
        return route(settings,  DoctorsListForClinicalVisit(controller: args['controller'],));
      case Routes.DoctorsClinicalListDetails:
        args as Map;
        return route(
            settings,
            DoctorsClinicalListDetails(
              doctorsName: args['doctorsName'],
              doctorsQualification: args['doctorsQualification'],
              doctorData: args['doctorData'],

            ));
      case Routes.thankingPage:
        args as Map;
        return route(
            settings,
            ThankingScreenClinicalVisit(
              doctorsName: args['doctorsName'],
              doctorsQualification: args['doctorsQualification'],
            ));
      case Routes.BookAppointmentForClinicalTiming:
        args as Map;
        return route(
            settings,
            BookAppointmentForClinicalTiming(
              doctorsName: args['doctorsName'],
              doctorsQualification: args['doctorsQualification'],
            ));

      case Routes.hospitalsBasedOnDoctor:
        return route(settings, HospitalsBasedOnDoctor());
      case Routes.doctorBasicDetails:
        args as Map;
        return route(
            settings, DoctorBasicDetails(doctorDetails: args['doctorDetails']));

      case Routes.scheduledAppointmentList:
        args as Map;
        return route(
            settings, ScheduledAppointmentList(hospitalId: args['hos_id'] , statusId: args['statusId'],fromDate: args['fromDate'],toDate: args['toDate'],));
      case Routes.currentAppointment:
        return route(settings, const CurrentAppointmentPage());
      case Routes.bookingAppointment:
        return route(settings, const BookingAppointmentPage());
      case Routes.addPatientComplaints:
        args as Map;
        return route(settings, AddComplaintsPage(data: args['data']));
      case Routes.detailedClinicalNotes:
        args as Map;
        return route(settings, DetailedClinicalNotes(data: args['data']));
      case Routes.uploadMedicalDocument:
        args as Map;
        return route(settings, UploadMedicalDoc(data: args['data']));
      case Routes.appointmentPatientDetails:
        args as Map;
        return route(
            settings,
            AppointmentPatientDetails(
              patID: args['patID'],
              apId: args['apId'],
              data: args['data'],
            ));

      case Routes.selectPatient:
        return route(settings, const SelectPatientPage());
        case Routes.patientDashboard:
        return route(settings, const PatientDashboard());
      case Routes.selectPatientDetails:
        return route(settings, const PatientDetailsSelectPage());
      case Routes.bookAppointment:
        return route(settings, BookAppointmentPage());
      case Routes.bookAppointmentPage:
        args as Map;
        return route(settings, AddAppointmentPage(isClinical: args['isClinical'] ?? false,));

      case Routes.patientRegistrationList:
        return route(settings, PatientRegistrationListPage());
      case Routes.todayInrScheduleList:
        return route(settings, ScheduleListPage());
      case Routes.totalPendingList:
        return route(
            settings,
            ScheduleListPage(
              isPendingList: true,
            ));
      case Routes.totalInrLineList:
        return route(settings, LineListPage());
        case Routes.VideoDashboard:
          return route(settings, VideoDashboard());
      case Routes.patientInrDetails:
        args as Map;
        return route(
          settings,
          ScheduleDetailsPage(
            patientID: args['patientID'],
            TTR: args['TTR'],
            patientage: args['patientage'],
            gender: args['gender'],
            phoneNumber: args['phoneNumber'],
            TTRfrom: args['TTRfrom'],
            TTRto: args['TTRto'],
          ),
        );
      case Routes.myInrDetails:
        args as Map;

        return route(
            settings,
            MyInrDetails(
                DcoID: (args ?? {})['DcoID'], PatID: (args ?? {})['PatID']));
      case Routes.patientScreenINRDetails:
        return route(settings, PatientViewInrDetailsScreen());

      case Routes.addInrDetails:
        args as Map;
        return route(
            settings,
            AddInrDetails(
              DocID: args['DocID'],
              patID: args['patID'],
            ));
      case Routes.doctorAddInrDetails:
        args as Map;
        return route(
            settings,
            DoctorAddInrDetails(
              DcoID: args['DcoID'],
              PatID: args['PatID'],
              weekData: args['weekData'],
              Date: args['Date'],
              PT_Patient: args['PT_Patient'],
              PT_Control: args['PT_Control'],
              INR: args['INR'],
              INR_Details_Id: args['INR_Details_Id'],
              Diagnosis: args['Diagnosis'],
              Drug: args['Drug'],
              Notes: args['Notes'],
              blocForTTR: args['blocForTTR'],
              OnlyTTR: args['OnlyTTR'],
              vkaDateWiseEntries: args['vkaDateWiseEntries'],
            ));
      case Routes.doctorProfile:
        return route(
            settings,
            ProfilePage(
                user: LocalStorage.getUser(), title: Consts.DOCTOR_PROFILE));
      case Routes.scheduleAppointmentPatient:
        args as Map;
        return route(
          settings,
          ScheduleAppointmentPage(
            instantDoctor: args['instantDoctor'],
            doctorGender: args['doctorGender'],
            doctorQualification: args['doctorQualification'],
            doctorTotalExperience: args['doctorTotalExperience'],
            doctorFee: args['doctorFee'],
          ),
        );
      case Routes.instantAppointmentDoctorsList:
        args as Map;
        return route(
            settings,
            InstantDoctorsList(
              speciality: args['speciality'],
              lang: args['lang'],
            ));
      case Routes.scheduleDoctorsList:
        args as Map;
        return route(
            settings,
            InstantDoctorsList(
              speciality: args['speciality'],
              lang: args['lang'],
              schedule: true,
            ));
      case Routes.medicalRecordsList:
        args as Map;
        return route(
            settings,
            MedicalRecordsList(
              appointment: args['appointment'],
              docID: args["docID"],
              patID: args["patID"],
            ));
      case Routes.medicalRecordsListFromCallLog:
        args as Map;
        return route(
            settings,
            MedicalRecordsListItemFromCallLog(
              docID: args['docID'],
              patID: args['patID'],
            ));
      case Routes.medicalRecordDetails:
        args as Map;
        return route(
            settings,
            MedicalRecordDetails(
              i: args['i'] ?? 0,
              data: args['data'],
              appointment: args['appointment'],
              appointment_id: args['appointment_id'],
            ));
      case Routes.patientRegistration:
        {
          if (args != null)
            return route(
                settings,
                PatientRegister(
                  data: (args as Patient),
                ));
          return route(settings, const PatientRegister());
        }
      case Routes.documentPreview:
        {
          args as Map;
          return route(
              settings,
              DocumentPreview(
                appointmentid: args['appointmentid'],
                title: args['title'],
              ));
        }
      case Routes.prescriptionPreview:
        {
          args as Map;
          return route(
              settings,
              PrescriptionPreview(
                patientbloc: args['patientbloc'],
                PresscriptionDrugList: args['PresscriptionDrugList'],
              ));
        }
      case Routes.addFamily:
        {
          if (args != null) {
            return route(
                settings,
                AddFamily(
                  data: (args as Patient),
                ));
          }
          return route(settings, const AddFamily());
        }
      case Routes.addFamilyEdit:
        {
          args as Map;
          return route(
              settings,
              AddFamilyEditScreen(
                // data: (args as Patient),
                userName: args['userName'],
                mobileNumber: args['mobileNumber'],
                age: args['age'],
                userId: args['userId'],
                familyMemberId: args['familyMemberId'],
                relationShipName: args['relationShipName'],
                gender: args['gender'],
                primaryMobile: args['primaryMobile'],
                primaryUserId: args['primaryUserId'],
                DOB: args['DOB'],
              ));
        }
      case Routes.tempRoute:
        return route(settings, const RoutesPage());

      case Routes.prescribeProductList:
        args as Map;
        return route(
            settings,
            PrescriptionList(
              data: args['data'] ?? [],
            ));
      case Routes.addressForm:
        return route(settings, const OrderAddressForm());
      // case Routes.imageOverview:
      //   return route(
      //       settings,
      //        ImageOverview(
      //         appointmentId: args["appointmentId"],
      //         name: args["name"],
      //       ));
      case Routes.paymentForm:
        args as Map;
        return route(
            settings,
            OrderPaymentPage(
              amount: args['amount'],
            ));
      case Routes.orderSummary:
        args as Map;
        return route(
            settings,
            OrderSummaryPage(
                orderId: args['OrderId'],
                amount: args['amount'],
                islab: args['islab'] ?? false,
                txn: args['txn']));
      case Routes.trackOrder:
        args as Map;
        return route(
            settings,
            OrderTrackPage(
              orderId: '${args['orderId']}',
              islab: args['islab'] ?? false,
            ));
      case Routes.orderStatusTimeline:
        args as Map;
        return route(settings, OrderStatusPage(orderId: '${args['order_id']}'));
      case Routes.ordersList:
        return route(settings, OrdersList());
      default:
        return route(settings, const SplashPage());
    }
  }

  static PageRoute route(RouteSettings settings, Widget page) =>
      MaterialPageRoute(builder: (_) => page, settings: settings);
}
