
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'next_appointment_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() =>
      _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  static const Color backgroundColor = Color(0xFFFAF8F6);
  static const Color brown = Color(0xFF9A6F48);
  static const Color dark = Color(0xFF241B17);
  static const Color muted = Color(0xFF81766F);

  late DateTime selectedDate;
  late DateTime displayedMonth;

  String? selectedTime;

  final List<String> weekdays = const [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun',
  ];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    displayedMonth = DateTime(
      selectedDate.year,
      selectedDate.month,
    );
  }

  List<String> get timeSlots {
    final List<String> slots = [];

    // Includes 9:00 AM through 6:00 PM, in 30-minute intervals.
    for (int minutes = 9 * 60; minutes <= 18 * 60; minutes += 30) {
      final int hour = minutes ~/ 60;
      final int minute = minutes % 60;
      final String period = hour >= 12 ? 'PM' : 'AM';
      final int displayHour = hour % 12 == 0 ? 12 : hour % 12;
      final String displayMinute = minute.toString().padLeft(2, '0');

      slots.add('$displayHour:$displayMinute $period');
    }

    return slots;
  }

  String get monthTitle {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[displayedMonth.month - 1]} ${displayedMonth.year}';
  }

  @override
  Widget build(BuildContext context) {
    final int daysInMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month + 1,
      0,
    ).day;

    // Monday-first calendar layout.
    final int firstWeekday =
        DateTime(displayedMonth.year, displayedMonth.month, 1).weekday;

    final int leadingEmptyCells = firstWeekday - 1;
    final int totalCells = ((leadingEmptyCells + daysInMonth + 6) ~/ 7) * 7;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: dark,
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Book Appointment',
          style: TextStyle(
            color: dark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSteps(),
          const Divider(height: 1, color: Color(0xFFEFE7E0)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
              children: [
                const Text(
                  'Select Date',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: dark,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Choose a day for your appointment.',
                  style: TextStyle(fontSize: 13, color: muted),
                ),
                const SizedBox(height: 18),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: const Color(0xFFEFE7E0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              monthTitle,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: dark,
                              ),
                            ),
                          ),
                          _monthArrow(
                            icon: Icons.chevron_left_rounded,
                            onTap: () {
                              setState(() {
                                displayedMonth = DateTime(
                                  displayedMonth.year,
                                  displayedMonth.month - 1,
                                );
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          _monthArrow(
                            icon: Icons.chevron_right_rounded,
                            onTap: () {
                              setState(() {
                                displayedMonth = DateTime(
                                  displayedMonth.year,
                                  displayedMonth.month + 1,
                                );
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: weekdays.map((day) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                day,
                                style: const TextStyle(
                                  color: muted,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: totalCells,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 7,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 3,
                          childAspectRatio: 0.82,
                        ),
                        itemBuilder: (context, index) {
                          final int day =
                              index - leadingEmptyCells + 1;

                          if (day < 1 || day > daysInMonth) {
                            return const SizedBox.shrink();
                          }

                          final date = DateTime(
                            displayedMonth.year,
                            displayedMonth.month,
                            day,
                          );

                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          final dateOnly = DateTime(
                            date.year,
                            date.month,
                            date.day,
                          );

                          final bool isToday = dateOnly == today;
                          final bool isSelected =
                              dateOnly ==
                              DateTime(
                                selectedDate.year,
                                selectedDate.month,
                                selectedDate.day,
                              );
                          final bool isPast = dateOnly.isBefore(today);

                          return GestureDetector(
                            onTap: isPast
                                ? null
                                : () {
                                    setState(() {
                                      selectedDate = date;
                                    });
                                  },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? brown : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                                border: isToday && !isSelected
                                    ? Border.all(color: brown)
                                    : null,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '$day',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected || isToday
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      color: isSelected
                                          ? Colors.white
                                          : isPast
                                              ? const Color(0xFFD0C7C0)
                                              : dark,
                                    ),
                                  ),
                                  if (isToday && !isSelected) ...[
                                    const SizedBox(height: 3),
                                    const Text(
                                      'Today',
                                      style: TextStyle(
                                        fontSize: 8,
                                        color: brown,
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),
                const Text(
                  'Available Time',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: dark,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Select your preferred time slot.',
                  style: TextStyle(fontSize: 13, color: muted),
                ),
                const SizedBox(height: 16),

                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: timeSlots.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.9,
                  ),
                  itemBuilder: (context, index) {
                    final time = timeSlots[index];
                    final bool isSelected = selectedTime == time;

                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? brown : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? brown
                                : const Color(0xFFE8DED5),
                          ),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : dark,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      // Fixed Next button stays visible while the calendar scrolls.
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 10, 20, 14),
        child: SizedBox(
          height: 54,
          child: ElevatedButton(
            onPressed: selectedTime == null
                ? null
                : () {
                    Get.to(
                      () => NextAppointmentScreen(
                        appointmentDate: selectedDate,
                        appointmentTime: selectedTime!,
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: brown,
              disabledBackgroundColor: const Color(0xFFD9C9BA),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward_rounded, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSteps() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Row(
        children: [
          _step(number: '1', label: 'Date', active: true),
          _stepLine(),
          _step(number: '2', label: 'Time', active: false),
          _stepLine(),
          _step(number: '3', label: 'Details', active: false),
        ],
      ),
    );
  }

  Widget _step({
    required String number,
    required String label,
    required bool active,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: active ? brown : const Color(0xFFF0E8E0),
            ),
            child: Text(
              number,
              style: TextStyle(
                color: active ? Colors.white : muted,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
              color: active ? brown : muted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _stepLine() {
    return Container(
      width: 26,
      height: 1.5,
      margin: const EdgeInsets.only(bottom: 22),
      color: const Color(0xFFE4D7CA),
    );
  }

  Widget _monthArrow({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: dark, size: 21),
      ),
    );
  }
}