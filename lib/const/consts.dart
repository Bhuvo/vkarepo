import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timesmedlite/model/user.dart';
import 'package:timesmedlite/ui/routes/routes.dart';
import 'package:timesmedlite/ui/widgets/m_drawer.dart';

import '../utils/local_storage.dart';

class Consts {
  Consts._();

  static const BASE_URL = 'https://tmsnew.timesmed.com/';
  static const BASE_URL_2 = 'https://api.timesmed.com/';
  static const RAZORPAY_BASE_URL = 'https://api.razorpay.com/v1/';

  //static const BASE_URL = 'https://api.timesmed.com/WebAPI2/';
  static const IMAGE_DOCTOR_BASE_URL =
      'https://www.timesmed.com/images/doc-imgs/';
  static const Patient_Display_Picture_Upload =
      "https://tmsnew.timesmed.com/images/patientimage/";
  static const String ISLOGGED = 'false';

  static const int RESEND_OTP_DURATION = 90;

  static const int WAITING_DURATION = 120;

  static const String TIMEOUT = 'TIMEOUT';
  static const String FEEDBACK = 'FEEDBACK';

  static const String USER_ID = 'delivery_user_id';
  static const String USER_TOKEN = 'delivery_user_token';
  static const String USER_NAME = 'delivery_user_name';
  static const String USER_MOBILE = 'delivery_user_mobile';

  static const CONNECTION_TITLE = 'Connection error';
  static const CONNECTION_MSG =
      'Please check your network connection and try again';

  static const String IS_LOGGED = 'isLogged';
  static const String REASON_FOR_REJECTION = 'Reason for rejection';
  static const String REJECTION_REASON = 'Rejection Reason: ';

  //
  static const String DELIVERED = 'Delivered';
  static const String TO_DELIVERY = 'To Delivery';
  static const String REJECTED = 'Rejected';
  static const String DOOR_LOCKED = 'Door Locked';
  static const String DETAILS_ERROR = 'Details Error';
  static const String TOTAL_NO_OF_ITEMS = 'Total No of Items: ';
  static const String ITEMS = 'Items';
  static const String QUANTITY = 'Quantity';
  static const String ORDERED_ON = 'Ordered on';
  static const String DEIVERY_EXPECTED_ON = 'Delivery Expected on';
  static const String DDMMYY = 'DD/MM/YYYY';

  static const String PATIENT_DETAILS = 'PATIENT DETAILS';
  static const String INSTANT_CALL_STATUS = 'INSTANT CALL STATUS';
  static const String INSTANT_CALL_REQUEST = 'INSTANT CALL REQUEST';
  static const String VIDEO_CALL_REQUEST = 'SCHEDULED VIDEO CALL REQUEST';
  static const String DAY_END = 'DAY END';
  static const String IN_QUEUE = 'IN QUEUE';
  static const String INCOMING_CALL = 'INCOMING CALL';
  static const String CALLING = 'Calling...';
  static const String DECLINE = 'Decline';
  static const String ACCEPT = 'Accept';
  static const String CONFIRM = 'Confirm';
  static const String DOCTOR_PRESCRIPTION = 'DOCTOR PRESCRIPTION';
  static const String CASE_SHEET = 'CASE SHEET';
  static const String VITAL_SIGNS_REPORT = 'VITAL SIGNS REPORT';
  static const String PRESCRIPTION_FORM = 'PRESCRIPTION FORM';
  static const String TEMPLATE = 'TEMPLATE';
  static const String SAVE_NEW_TEMPLATE = 'SAVE NEW TEMPLATE';
  static const String UPDATE_CALL_STATUS = 'UPDATE CALL STATUS';

  static const String LAB_TEST_REQUEST = 'LAB TEST REQUEST';
  static const String CLINICAL_NOTES = 'CLINICAL NOTES';
  static const String ADD_INR_DETAILS = 'ADD INR DETAILS';

  static const double padding = 16.0;
  static const double avatarRadius = 16.0;
  static const String STOCKS_TO_PICK_FOR_THE_DAY =
      'Stocks to pickup\nfor the day';
  static const String DELIVERY_SUCCESSFUL = 'Delivery Successful!';
  static const String RATE_YOUR_CUSYOMER = 'Rate your Customer';
  static const String REMARKS = 'Remarks';
  static const String NO_OF_VISITS = 'No of Visits Done: ';
  static const String TIME_OF_THE_VISIT = 'Time of the visit: ';
  static const String RE_ATTEMPT_DATE = 'Re-attempt date: ';
  static const String BOOK_AN_APPOINTMENT = 'Book an Appointment';
  static const String BOOKINGS = 'Bookings';
  static const String SEARCH_DOCTORS = 'SEARCH DOCTORS';
  static const String BOOK_APPOINTMENT = 'Book Appointment';
  static const String BOOK_AN_N_APPOINTMENT = 'Book an\nAppointment';
  static const String PREVIOUS_APPOINTMENT = 'Previous Appointments';
  static const String UPCOMING_APPOINTMENT = 'Upcoming Appointments';
  static const String CHOOSE_ACCOUNT = 'Choose Account';
  static const String ADD_PATIENT = 'Add Patient';
  static const String ADD_PATIENT_EDIT = 'Edit Patient Details';
  static const String MEDICAL_RECORDS = 'Medical Records';
  static const String PDF_PREVIEW = 'PDF PREVIEW';
  static const String VIEW_HISTORY = 'View History';
  static const String PRESCRIPTION = 'Prescription';
  static const String LABTEST = 'Labtest';
  static const String HEALTH_RECORDS = 'Health Records';
  static const String PREVIOUS_RECORDS = 'Previous Records';
  static const String RESCHEDULE_APPOINTMENT = 'RESCHEDULE APPOINTMENT';
  static const String SELECT_USER = 'SELECT USER';
  static const String VITAL_SIGN = 'VITAL SIGN';

  static const String FREE_REVIEW = 'FREE REVIEW';
  static const String PAID_RE_VISIT = 'PAID RE-VISIT';
  static const String COMPLETE_CONSULTATION = 'COMPLETE CONSULTATION';
  static const String DOCTOR_BASIC_DETAILS = 'DOCTOR BASIC DETAILS';
  static const String ADD_NEW_COMPLAINT = 'ADD NEW COMPLAINT';

  static const String EXISTING_USER = 'EXISTING USER';
  static const String NEW_USER = 'NEW USER';

  static const String SUN = 'Sun';
  static const String MON = 'Mon';
  static const String TUE = 'Tue';
  static const String WED = 'Wed';
  static const String THU = 'Thu';
  static const String FRI = 'Fri';
  static const String SAT = 'Sat';

  static const String SUNDAY = 'Sunday';
  static const String MONDAY = 'Monday';
  static const String TUESDAY = 'Tuesday';
  static const String WEDNESDAY = 'Wednesday';
  static const String THURSDAY = 'Thursday';
  static const String FRIDAY = 'Friday';
  static const String SATURDAY = 'Saturday';

  static const daysOfWeek = [
    Consts.SUN,
    Consts.MON,
    Consts.TUE,
    Consts.WED,
    Consts.THU,
    Consts.FRI,
    Consts.SAT,
  ];
  static const daysOfWeekFull = [
    Consts.SUNDAY,
    Consts.MONDAY,
    Consts.TUESDAY,
    Consts.WEDNESDAY,
    Consts.THURSDAY,
    Consts.FRIDAY,
    Consts.SATURDAY,
  ];

  static const String MORNING = 'MORNING';
  static const String AFTERNOON = 'AFTERNOON';
  static const String EVENING = 'EVENING';
  static const String NIGHT = 'NIGHT';

  static const String CALENDAR = 'CALENDAR';
  static const String PATIENT_WAITING_LIST = 'PATIENT WAITING LIST';
  static const String CALL_LOG = 'CALL LOG';
  static const String MISSED_CALL = 'MISSED CALL';
  static const String PREVIEW = 'PREVIEW';

  static const String INSTANT = 'Instant';
  static const String SCHEDULE = 'Schedule';

  static const String CLINICAL_VISIT = 'Clinical Visit';
  static const String VIDEO_CONSULTATION = 'Video Consultation';

  static const String SCHEDULE_APPOINTMENT = 'SCHEDULE APPOINTMENT';
  static const String SCHEDULED_APPOINTMENT_LIST = 'SCHEDULED APPOINTMENT LIST';
  static const String CURRENT_APPOINTMENT = 'CURRENT APPOINTMENT';
  static const String BOOKING_APPOINTMENT = ' BOOKING APPOINTMENT';
  static const String INSTANT_DOCTORS = 'INSTANT DOCTORS';

  static const String DASHBOARD = 'Dashboard';
  static const String TELE_MEDICINE = 'TELE MEDICINE';
  static const String PATIENT_REGISTRATION = 'Patient Registration';
  static const String TODAY_INR_SCHEDULE_LIST = 'Today Inr Schedule List';
  static const String TODAY_INR_SCHEDULE = 'Today Inr Schedule';
  static const String TOTAL_INR = 'Total Inr';
  static const String TOTAL_PENDING_CASES = 'Total Pending Cases';
  static const String TOTAL_INR_LINELIST = 'TOTAL INR LINELIST';
  static const String PATIENT_INR_DETAILS = 'PATIENT INR DETAILS';
  static const String DOCTOR_PROFILE = 'Doctor Profile';

  static const String ONLINE_WAITING_HALL = 'ONLINE WAITING HALL';
  static const String HOSPITAL_LIST_BASED_ON_DOCTOR =
      'HOSPITAL LIST - BASED ON DOCTOR';
  static const String HOME = 'HOME';
  static const String ACCOUNT = 'ACCOUNT';
  static const String MY_ORDERS = 'MY ORDERS';
  static const String INR_DETAILS = 'INR DETAILS';
  static const String INSTRUCTIONS = 'Instructions';

  static const String doctor = 'Doctor';
  static const String nurse = 'Nurse';
  static const String frontOffice = 'FOffice';

  // static const freqs = [
  //   "1-1-0-1",
  //   "1-0-0-1",
  //   "1-1-0-0",
  //   "1-0-0-0",
  //   "0-1-0-0",
  //   "0-0-1-0",
  //   "0-0-0-1",
  //   "1-1-1-1",
  //   "0-0-0-0",
  // ];

  static const freqs = [
    '1-1-0-1',
    '1-0-0-1',
    '1-1-0-0',
    '1-0-0-0',
    '0-1-0-0',
    '0-0-1-0',
    '0-0-0-1',
    '1-1-1-1',
    '0-0-0-0',
  ];

  static const foodRels = [
    'Before Food',
    'After Food',
    'Intake/How to use',
    'Apply External',
  ];

  // static const foodRels = [
  //   'Before Food',
  //   'After Food',
  //   'With Food',
  //   'Apply External',
  //   'Before Bedtime',
  //   'On an Empty Stomach As Needed'
  // ];

  static const User DUMMY_USER = User(
      fullName: 'Vicky',
      age: 25,
      gender: 0,
      id: 'BH234',
      email: 'aravind@gmail.com',
      phone: '9551917102',
      whatsapp: '6381485146',
      designation: 'MBBS');

  static const List<MDrawerItem> DRAWER_ITEMS = [
    MDrawerItem(DASHBOARD, Routes.dashboard, icon: FontAwesomeIcons.chartPie),
    MDrawerItem(PATIENT_REGISTRATION, Routes.patientRegistrationList,
        icon: FontAwesomeIcons.userCheck),
    MDrawerItem(TODAY_INR_SCHEDULE, Routes.todayInrScheduleList,
        icon: FontAwesomeIcons.clipboardList),
    MDrawerItem(TOTAL_PENDING_CASES, Routes.totalPendingList,
        icon: FontAwesomeIcons.userClock),
    MDrawerItem(TOTAL_INR_LINELIST, Routes.totalInrLineList,
        icon: FontAwesomeIcons.rectangleList),
    MDrawerItem(DOCTOR_PROFILE, Routes.doctorProfile,
        icon: FontAwesomeIcons.userDoctor),
    // MDrawerItem('PATIENT MODULE', Routes.tempRoute, icon: FontAwesomeIcons.patreon),
  ];

  static const List<MDrawerItem> NURSE_BOTTOM_NAVIGATION_ITEMS = [
    MDrawerItem(CALENDAR, Routes.calendarPage,
        icon: FontAwesomeIcons.solidCalendarDays),
    // MDrawerItem(PATIENT_WAITING_LIST, Routes.patientWaitingList,
    //     icon: FontAwesomeIcons.userClock),
    // MDrawerItem(CALL_LOG, Routes.callLogs, icon: FontAwesomeIcons.squarePhone),
    // MDrawerItem(MISSED_CALL, Routes.missedCalls,
    //     icon: FontAwesomeIcons.phoneSlash),
    MDrawerItem(DASHBOARD, Routes.currentAppointment,
        icon: FontAwesomeIcons.chartPie),
    // MDrawerItem(TELE_MEDICINE, Routes.dashboard,
    //     icon: FontAwesomeIcons.houseMedicalCircleCheck),
    MDrawerItem(BOOK_APPOINTMENT, Routes.bookingAppointment,
        icon: FontAwesomeIcons.penClip),
    MDrawerItem(PATIENT_REGISTRATION, Routes.patientRegistrationList,
        icon: FontAwesomeIcons.userCheck),
    // MDrawerItem(TODAY_INR_SCHEDULE, Routes.todayInrScheduleList, icon: FontAwesomeIcons.clipboardList),
    // MDrawerItem(TOTAL_PENDING_CASES, Routes.totalPendingList,
    //     icon: FontAwesomeIcons.userClock),
    // MDrawerItem(TOTAL_INR_LINELIST, Routes.totalInrLineList, icon: FontAwesomeIcons.rectangleList),
    MDrawerItem('PROFILE', Routes.doctorProfile,
        icon: FontAwesomeIcons.userDoctor), //DOCTOR_PROFILE
  ];

  static const List<MDrawerItem> BOTTOM_NAVIGATION_ITEMS = [
    MDrawerItem(CALENDAR, Routes.calendarPage,
        icon: FontAwesomeIcons.solidCalendarDays),
    MDrawerItem(PATIENT_WAITING_LIST, Routes.patientWaitingList,
        icon: FontAwesomeIcons.userClock),
    MDrawerItem(CALL_LOG, Routes.callLogs, icon: FontAwesomeIcons.squarePhone),
    MDrawerItem(MISSED_CALL, Routes.missedCalls,
        icon: FontAwesomeIcons.phoneSlash),
    MDrawerItem(DASHBOARD, Routes.currentAppointment,
        icon: FontAwesomeIcons.chartPie),
    MDrawerItem(TELE_MEDICINE, Routes.dashboard,
        icon: FontAwesomeIcons.houseMedicalCircleCheck),
    MDrawerItem(BOOK_APPOINTMENT, Routes.bookingAppointment,
        icon: FontAwesomeIcons.penClip),
    MDrawerItem(PATIENT_REGISTRATION, Routes.patientRegistrationList,
        icon: FontAwesomeIcons.userCheck),
    // MDrawerItem(TODAY_INR_SCHEDULE, Routes.todayInrScheduleList, icon: FontAwesomeIcons.clipboardList),
    MDrawerItem(TOTAL_PENDING_CASES, Routes.totalPendingList,
        icon: FontAwesomeIcons.userClock),
    // MDrawerItem(TOTAL_INR_LINELIST, Routes.totalInrLineList, icon: FontAwesomeIcons.rectangleList),
    MDrawerItem('PROFILE', Routes.doctorProfile,
        icon: FontAwesomeIcons.userDoctor),
  ];

  static const List<MDrawerItem> PATIENT_BOTTOM_NAVIGATION_ITEMS = [
    //MDrawerItem(ONLINE_WAITING_HALL, Routes.inQueuePage, icon: CupertinoIcons.clock_fill),
    MDrawerItem(HOME, Routes.bookAppointment, icon: CupertinoIcons.home),
    MDrawerItem(MY_ORDERS, Routes.ordersList, icon: CupertinoIcons.cube_box),
    // MDrawerItem(DASHBOARD, Routes.currentAppointment,
    //     icon: FontAwesomeIcons.chartPie),
    // MDrawerItem(BOOK_APPOINTMENT, Routes.bookingAppointment,
    //     icon: FontAwesomeIcons.penClip),
    MDrawerItem(INR_DETAILS, Routes.patientScreenINRDetails,
        icon: CupertinoIcons.graph_circle_fill),
    MDrawerItem('Vital Sin', Routes.vital,
        icon: CupertinoIcons.chart_bar),
    MDrawerItem(ACCOUNT, Routes.patientAccountPage,
        icon: CupertinoIcons.person_fill),
    MDrawerItem(INSTRUCTIONS, Routes.pdfVka, icon: FontAwesomeIcons.print),
  ];
}
