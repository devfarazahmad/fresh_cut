import 'package:flutter/material.dart';

import '../models/user_model.dart';

class HomeScreen extends StatefulWidget {
  final UserModel? user;

  const HomeScreen({
    super.key,
    this.user,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, dynamic>> services = [
    {
      'name': 'Haircut',
      'description': 'Classic and modern cuts',
      'price': 'Rs. 500',
      'image': 'assets/images/flowly_logo.png',
      'icon': Icons.content_cut,
    },
    {
      'name': 'Beard Trim',
      'description': 'Shape and define your beard',
      'price': 'Rs. 300',
      'image': 'assets/images/flowly_logo.png',
      'icon': Icons.face_retouching_natural,
    },
    {
      'name': 'Hair Wash',
      'description': 'Cleanse and refresh your hair',
      'price': 'Rs. 250',
      'image': 'assets/images/flowly_logo.png',
      'icon': Icons.water_drop_outlined,
    },
    {
      'name': 'Hair Styling',
      'description': 'Look sharp for every occasion',
      'price': 'Rs. 600',
      'image': 'assets/images/flowly_logo.png',
      'icon': Icons.brush_outlined,
    },
    {
      'name': 'Hair Coloring',
      'description': 'Refresh your look with color',
      'price': 'Rs. 1,200',
      'image': 'assets/images/flowly_logo.png',
      'icon': Icons.palette_outlined,
    },
    {
      'name': 'Facial',
      'description': 'A fresh and clean appearance',
      'price': 'Rs. 800',
      'image': 'assets/images/flowly_logo.png',
      'icon': Icons.spa_outlined,
    },
  ];

  String searchQuery = '';

  List<Map<String, dynamic>> get filteredServices {
    if (searchQuery.trim().isEmpty) {
      return services;
    }

    return services.where((service) {
      final name = service['name'].toString().toLowerCase();
      final description =
          service['description'].toString().toLowerCase();

      return name.contains(searchQuery.toLowerCase()) ||
          description.contains(searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String userName =
        widget.user?.name.trim().isNotEmpty == true
            ? widget.user!.name.trim()
            : 'Salon User';

    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F6),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  children: [
                    Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF0DFCF),
                        border: Border.all(
                          color: const Color(0xFFC89B6D),
                          width: 1.5,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/flowly_logo.png',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.person_rounded,
                              size: 34,
                              color: Color(0xFF9A6F48),
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(width: 13),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good morning,',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF81766F),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            userName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF241B17),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFFECE4DE),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'You have no new notifications.',
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          size: 27,
                          color: Color(0xFF342923),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Search bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 27, 20, 0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search services...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF9A9089),
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF9A6F48),
                      size: 25,
                    ),
                    suffixIcon: searchQuery.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                              setState(() {
                                searchQuery = '';
                              });
                            },
                            icon: const Icon(Icons.close_rounded),
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xFFECE4DE),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xFFECE4DE),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Color(0xFFC89B6D),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Promotional banner
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A211D),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'YOUR STYLE, YOUR RULES',
                              style: TextStyle(
                                color: Color(0xFFC89B6D),
                                fontSize: 10,
                                letterSpacing: 1.4,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Look Sharp.\nFeel Confident.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                height: 1.3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Find the perfect service for your style.',
                              style: TextStyle(
                                color: Color(0xFFD5C9C1),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.content_cut_rounded,
                        size: 65,
                        color: Color(0xFFC89B6D),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Popular services heading
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 29, 20, 16),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Popular Services',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF241B17),
                        ),
                      ),
                    ),
                    Text(
                      '${filteredServices.length} services',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF9A6F48),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Scrollable two-column services grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverLayoutBuilder(
                builder: (context, constraints) {
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 242,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final service = filteredServices[index];

                        return _ServiceCard(
                          name: service['name'] as String,
                          description:
                              service['description'] as String,
                          price: service['price'] as String,
                          imagePath: service['image'] as String,
                          icon: service['icon'] as IconData,
                        );
                      },
                      childCount: filteredServices.length,
                    ),
                  );
                },
              ),
            ),

            if (filteredServices.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: 50,
                          color: Color(0xFFC89B6D),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'No services found',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Try searching for another service.',
                          style: TextStyle(
                            color: Color(0xFF81766F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 25),
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final String imagePath;
  final IconData icon;

  const _ServiceCard({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFFECE4DE),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFF3E8DC),
                      child: Icon(
                        icon,
                        size: 52,
                        color: const Color(0xFF9A6F48),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 9,
                  right: 9,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.95),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      price,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2A211D),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(11, 11, 11, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF241B17),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    height: 1.3,
                    color: Color(0xFF81766F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}