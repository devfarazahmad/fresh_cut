
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'book_appointment_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isFavorite = false;

  static const Color backgroundColor = Color(0xFFFAF8F6);
  static const Color brown = Color(0xFF9A6F48);
  static const Color dark = Color(0xFF241B17);
  static const Color muted = Color(0xFF81766F);

  final List<Map<String, dynamic>> services = [
    {
      'name': 'Classic Haircut',
      'description': 'Professional haircut and styling',
      'price': 25,
      'duration': '30 min',
      'icon': Icons.content_cut,
    },
    {
      'name': 'Beard Trim',
      'description': 'Shape and trim your beard',
      'price': 15,
      'duration': '20 min',
      'icon': Icons.face_retouching_natural,
    },
    {
      'name': 'Hair Wash',
      'description': 'Refreshing hair wash',
      'price': 10,
      'duration': '15 min',
      'icon': Icons.water_drop_outlined,
    },
    {
      'name': 'Haircut & Beard',
      'description': 'Complete grooming experience',
      'price': 35,
      'duration': '45 min',
      'icon': Icons.spa_outlined,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  height: 260,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/flowly_logo.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: const Color(0xFFE9DED3),
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 110,
                            color: brown,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 12,
                  left: 18,
                  child: _circleButton(
                    icon: Icons.arrow_back,
                    onTap: () {
                      // Return to the Home tab in the main navigation.
                      Get.offNamed('/home');
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top + 12,
                  right: 18,
                  child: _circleButton(
                    icon: isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    iconColor: isFavorite ? Colors.red : dark,
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 45,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.18),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/barber.jpg',
                      height: 92,
                      width: 92,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 72,
                          width: 72,
                          color: const Color(0xFFF3E8DC),
                          child: const Icon(
                            Icons.person,
                            size: 48,
                            color: brown,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ahmed Khan',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: dark,
                            ),
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Icon(
                                Icons.workspace_premium_outlined,
                                color: brown,
                                size: 18,
                              ),
                              SizedBox(width: 6),
                              Text(
                                '8 years of experience',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: muted,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 18,
                                color: Color(0xFFE3A23B),
                              ),
                              SizedBox(width: 4),
                              Text(
                                '4.9  •  Professional Barber',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: muted,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
              child: Text(
                'Passionate about modern and classic grooming, Ahmed '
                'provides personalized haircuts and beard styling. '
                'His attention to detail helps every client'
                '',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.65,
                  color: muted,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 0, 22, 14),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Services & Pricing',
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: dark,
                      ),
                    ),
                  ),
                  Text(
                    '${services.length} services',
                    style: const TextStyle(
                      color: muted,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final service = services[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: const Color(0xFFEFE7E0),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF3E8DC),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            service['icon'] as IconData,
                            color: brown,
                            size: 25,
                          ),
                        ),
                        const SizedBox(width: 13),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service['name'] as String,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: dark,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                service['description'] as String,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: muted,
                                ),
                              ),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    size: 14,
                                    color: muted,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    service['duration'] as String,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: muted,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '\$${service['price']}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: brown,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: services.length,
              ),
            ),
          ),
        ],
      ),

      // Fixed button: stays visible when the page scrolls.
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 10, 20, 14),
        child: SizedBox(
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              Get.to(() => const BookAppointmentScreen());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: brown,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book an Appointment',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward_rounded, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = dark,
  }) {
    return Material(
      color: Colors.white.withOpacity(0.94),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          height: 46,
          width: 46,
          child: Icon(icon, color: iconColor, size: 23),
        ),
      ),
    );
  }
}