
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextAppointmentScreen extends StatelessWidget {
  final DateTime appointmentDate;
  final String appointmentTime;

  const NextAppointmentScreen({
    super.key,
    required this.appointmentDate,
    required this.appointmentTime,
  });

  static const Color backgroundColor = Color(0xFFFAF8F6);
  static const Color brown = Color(0xFF9A6F48);
  static const Color dark = Color(0xFF241B17);
  static const Color muted = Color(0xFF81766F);

  @override
  Widget build(BuildContext context) {
    final String formattedDate =
        '${_monthName(appointmentDate.month)} ${appointmentDate.day}, '
        '${appointmentDate.year}';

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: dark,
        ),
        title: const Text(
          'Appointment Details',
          style: TextStyle(
            color: dark,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 28),
            Container(
              height: 85,
              width: 85,
              decoration: BoxDecoration(
                color: const Color(0xFFF3E8DC),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.event_available_rounded,
                color: brown,
                size: 43,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Almost there!',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: dark,
              ),
            ),
            const SizedBox(height: 9),
            const Text(
              'Your selected appointment details are below. '
              'Customer details and final confirmation can be '
              'added here next.',
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: muted,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: const Color(0xFFEFE7E0)),
              ),
              child: Column(
                children: [
                  _detailRow(
                    icon: Icons.calendar_month_rounded,
                    title: 'Appointment date',
                    value: formattedDate,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(color: Color(0xFFEFE7E0)),
                  ),
                  _detailRow(
                    icon: Icons.access_time_rounded,
                    title: 'Appointment time',
                    value: appointmentTime,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: Divider(color: Color(0xFFEFE7E0)),
                  ),
                  _detailRow(
                    icon: Icons.person_outline_rounded,
                    title: 'Barber',
                    value: 'Ahmed Khan',
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  foregroundColor: brown,
                  side: const BorderSide(color: brown),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Change Date or Time',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _detailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFF3E8DC),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Icon(icon, color: brown, size: 22),
        ),
        const SizedBox(width: 13),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  color: muted,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: dark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return months[month - 1];
  }
}