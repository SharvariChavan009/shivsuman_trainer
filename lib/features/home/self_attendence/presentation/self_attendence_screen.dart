import 'package:car_trainer_application/core/common/colors.dart';
import 'package:car_trainer_application/core/common/images/images_constant.dart';
import 'package:car_trainer_application/core/navigation/navigationHelper.dart';
import 'package:car_trainer_application/features/home/notification/presentation/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class SelfAttendenceScreen extends StatefulWidget {
  const SelfAttendenceScreen({super.key});

  @override
  State<SelfAttendenceScreen> createState() => _SelfAttendenceScreenState();
}

class _SelfAttendenceScreenState extends State<SelfAttendenceScreen> {
  late DateTime _selectedDate;
  DateTime focusedDay = DateTime.now();
  //!----------------------------------------------------------------
  String _checkInTime = "No time picked";
  String _checkOutTime = "No time picked";
  String _year = "No year picked";
  String _checkWhichFunctionCalled = "";
  bool _checkInClicked = false;
  bool _checkOutClicked = false;


  void _datePicker() {
    final DateTime now = DateTime.now();
    final DateFormat pickYear = DateFormat('dd-MM-yyyy');
    final String formatted = pickYear.format(now);

    setState(() {
      _year = formatted;
    });
  }

  void _timePicker() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('hh:mm a');
    final String formatted = formatter.format(now);

    setState(() {
      _checkWhichFunctionCalled == "checkIn"
          ? _checkInTime = formatted
          : _checkOutTime = formatted;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = DateTime.now();
  }
  //!----------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(
            Icons.turn_left,
            size: 35,
            color: AppColors.darkColor,
          ),
          onTap: () {
            NavigationHelper.goBack(context);
          },
        ),
        actions: [
          Row(
            children: [
              const Text(
                "Michael Mitc",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                    fontFamily: "Poppins"),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(23), // Image radius
                      child: Image.asset(AppImages.personPlaceholder,
                          fit: BoxFit.cover),
                    ),
                  )),
              GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.only(right: 10.0, left: 10),
                  child: ImageIcon(
                    color: AppColors.darkColor,
                    AssetImage(AllIcons.notification1),
                    size: 30,
                  ),
                ),
                onTap: () {
                  NavigationHelper.navigateTo(
                      context, const NotificationScreen());
                },
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          //! Section 1

          TableCalendar(
            daysOfWeekStyle: DaysOfWeekStyle(
              // weekdayStyle: CustomStyles.verySmallTextStyle(),
              // weekendStyle: CustomStyles.verySmallTextStyle(
              //     fontSize: CustomStyles.smallSFontSize),
            ),
            calendarStyle: CalendarStyle(
                // weekendTextStyle: CustomStyles.verySmallTextStyle(
                //   fontSize: CustomStyles.smallSFontSize,
                //   fontWeight: CustomStyles.smallFontWeight,
                //   fontFamily: CustomStyles.popponsFont,
                // ),
                // defaultTextStyle: CustomStyles.verySmallTextStyle(
                //     fontSize: CustomStyles.smallSFontSize),
                isTodayHighlighted: true,
                todayDecoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                // todayTextStyle: CustomStyles.verySmallTextStyle(
                //     fontSize: CustomStyles.mediumXSFontSize,
                //     fontWeight: CustomStyles.smallFontWeight,
                //     fontFamily: CustomStyles.popponsFont,
                //     color: CustomStyles.appthemeColor),
                selectedDecoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                // selectedTextStyle: CustomStyles.boldTextStyle(
                //   color: CustomStyles.appthemeColor,
                //   fontSize: CustomStyles.mediumXSFontSize,
                // )
            ),
            headerVisible: false,
            selectedDayPredicate: (day) =>
                isSameDay(day, _selectedDate),
            pageAnimationEnabled: false,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            availableGestures: AvailableGestures.horizontalSwipe,
            focusedDay: _selectedDate,
            calendarFormat: CalendarFormat.week,
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: (selectedDate, focusedDate) {
              DateTime currentWeekStart = _selectedDate
                  .subtract(Duration(days: _selectedDate.weekday - 1));
              DateTime currentWeekEnd =
              currentWeekStart.add(const Duration(days: 6));
              if (selectedDate.isBefore(currentWeekStart) ||
                  selectedDate.isAfter(currentWeekEnd)) {
                setState(() async {
                  _selectedDate = currentWeekStart;
                });
              } else {
                // setState(() {
                //     _selectedDate = selectedDate;
                // });
              }
            },
          ),

          //! Section 2

          const Padding(
            padding: EdgeInsets.only(top: 15.0, bottom: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Today Attendence",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: "Poppins"),
                )
              ],
            ),
          ),

          //! Section 3

          Row(
            children: [
              //? Container 1

              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      // color: Color.fromARGB(255, 134, 151, 204),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      AllIcons.checkIn,
                                      fit: BoxFit.cover,
                                      color: AppColors.buttonColorNew,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Check In",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "Poppins"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              _checkInTime,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "On Time",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_checkInClicked == false) {
                      _checkWhichFunctionCalled = "checkIn";
                      _datePicker();
                      _timePicker();
                      print("CheckIn time: $_checkInTime & Year: $_year");

                      setState(() {
                        _checkInClicked = true;
                      });
                    } else {
                      print("Already CheckIn....");
                    }
                  },
                ),
              )),

              //? Container 2

              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 8),
                child: GestureDetector(
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      // color: Color.fromARGB(255, 134, 151, 204),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      AllIcons.checkOut,
                                      fit: BoxFit.cover,
                                      color: AppColors.buttonColorNew,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Check Out",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: "Poppins"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              _checkOutTime,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Go Home",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    if (_checkOutClicked == false) {
                      _checkWhichFunctionCalled = "checkOut";
                      _datePicker();
                      _timePicker();
                      print("CheckOut time: $_checkOutTime & Year: $_year");
                      setState(() {
                        _checkOutClicked = true;
                      });
                    } else {
                      print("Already CheckOut....");
                    }
                  },
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
