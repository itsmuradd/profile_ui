import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFollowing = false;
  int followers = 1250;
  int projects = 24;
  int experience = 5;
  int rating = 4;

  void _toggleFollow() {
    setState(() {
      isFollowing = !isFollowing;
      followers += isFollowing ? 1 : -1;
    });
  }

  void _updateProjects() {
    setState(() {
      projects += 1;
      rating = (rating % 5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFF4F7FF),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 260,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF3F51B5), Color(0xFF6574CF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.15),
                            blurRadius: 18,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 72),
                          Text(
                            'Ayesha Siddiqui',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'UI/UX Designer',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.location_on, size: 16, color: Colors.indigo),
                              const SizedBox(width: 4),
                              Text(
                                'Karachi, Pakistan',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Rating Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ...List.generate(5, (i) {
                                return Icon(
                                  i < rating ? Icons.star : Icons.star_border,
                                  color: Colors.amber,
                                  size: 18,
                                );
                              }),
                              const SizedBox(width: 8),
                              Text(
                                '$rating.0 (128 reviews)',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _sectionDivider(),
                          const SizedBox(height: 24),
                          // Contact Information
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Contact Information',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _detailItem('Email', 'ayesha@email.com'),
                                  _detailItem('Phone', '+92-3001234567'),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _detailItem('ID', 'UI-2048'),
                                  _detailItem('Location', 'Karachi'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _sectionDivider(),
                          const SizedBox(height: 24),
                          // Professional Details
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Professional Details',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _detailItem('Department', 'Design'),
                                  _detailItem('Batch', '2024'),
                                ],
                              ),
                              const SizedBox(height: 14),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _detailItem('Level', 'Senior'),
                                  _detailItem('Availability', 'Available'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _sectionDivider(),
                          const SizedBox(height: 24),
                          // Statistics
                          Row(
                            children: [
                              Expanded(
                                child: _statCard('Projects', projects.toString()),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _statCard('Followers', '$followers'),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _statCard('Experience', '$experience y'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _sectionDivider(),
                          const SizedBox(height: 24),
                          // Skills Section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Skills',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  _skillChip('UI Design'),
                                  _skillChip('Figma'),
                                  _skillChip('Prototyping'),
                                  _skillChip('User Research'),
                                  _skillChip('Adobe XD'),
                                  _skillChip('Wireframing'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _sectionDivider(),
                          const SizedBox(height: 24),
                          // About Me Section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'About Me',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Creative and passionate UI/UX Designer with 5+ years of experience designing beautiful, user-friendly digital products. Specialized in creating intuitive interfaces, conducting user research, and translating complex ideas into elegant design solutions. Committed to continuous learning and staying updated with latest design trends.',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.6,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _sectionDivider(),
                          const SizedBox(height: 24),
                          // Action Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _toggleFollow,
                                  icon: Icon(isFollowing ? Icons.check : Icons.add),
                                  label: Text(isFollowing ? 'Following' : 'Follow'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _updateProjects,
                                  icon: const Icon(Icons.add_circle_outline),
                                  label: const Text('Add Project'),
                                  style: OutlinedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 6,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.15),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 68,
                          backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=400',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _actionButton(Icons.message, 'Message'),
                    _actionButton(Icons.call, 'Call'),
                    _actionButton(Icons.share, 'Share'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailItem(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(IconData icon, String label) {
    return Expanded(
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.04),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.indigo, size: 20),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionDivider() {
    return Container(
      height: 1,
      color: Colors.grey[300],
    );
  }

  Widget _skillChip(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEFB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFD0D9F0),
        ),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF3F51B5),
        ),
      ),
    );
  }
}

