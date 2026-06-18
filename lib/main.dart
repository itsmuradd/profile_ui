import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ─────────────────────────────────────────────
//  App Root
// ─────────────────────────────────────────────
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4AB8E8),
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

// ─────────────────────────────────────────────
//  Profile Screen  (StatefulWidget for setState)
// ─────────────────────────────────────────────
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ── State variables ────────────────────────
  bool _isFollowing = false;
  String _statusText = 'Available for work';
  int _followerCount = 1200;
  int _projectCount = 12;

  // ── Color palette ─────────────────────────
  static const Color _bgColor = Color(0xFFF2F5FA);
  static const Color _cardColor = Colors.white;
  static const Color _accentBlue = Color(0xFF4AB8E8);
  static const Color _darkText = Color(0xFF1A1F2E);
  static const Color _mutedText = Color(0xFF8A94A6);
  static const Color _detailBg = Color(0xFFEEF2F8);
  static const Color _navActive = Color(0xFF4AB8E8);

  // ── Follow toggle ──────────────────────────
  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
      _followerCount = _isFollowing ? 1201 : 1200;
    });
  }

  // ── Update Status (setState demo) ─────────
  void _updateStatus() {
    final statuses = [
      'Available for work',
      'Open to collaborations',
      'Currently busy 🔴',
      'Designing something new ✨',
    ];
    setState(() {
      final current = statuses.indexOf(_statusText);
      _statusText = statuses[(current + 1) % statuses.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,

      // ── AppBar ───────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              size: 18, color: _darkText),
          onPressed: () {},
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: _accentBlue,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined,
                size: 22, color: _darkText),
            onPressed: () {},
          ),
        ],
      ),

      // ── Body ─────────────────────────────────
      body: Column(
        children: [
          // Scrollable main content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ── Banner + Avatar Stack ──────
                  _buildBannerSection(),

                  // ── Name & Profession ──────────
                  const SizedBox(height: 14),
                  const Text(
                    'Murad Hussain',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: _darkText,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'UI/UX Designer',
                    style: TextStyle(
                      fontSize: 14,
                      color: _accentBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // ── Status badge (setState result) ──
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _accentBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _statusText,
                      style: const TextStyle(
                        fontSize: 12,
                        color: _accentBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Action Buttons ─────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // Follow button
                        Expanded(
                          child: GestureDetector(
                            onTap: _toggleFollow,
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                gradient: _isFollowing
                                    ? const LinearGradient(colors: [
                                  Color(0xFF8ACCE8),
                                  Color(0xFF4AB8E8)
                                ])
                                    : const LinearGradient(colors: [
                                  Color(0xFF4AB8E8),
                                  Color(0xFF2196F3)
                                ]),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                    _accentBlue.withOpacity(0.35),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  _isFollowing ? 'Following ✓' : 'Follow',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Message button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: const Color(0xFFD0D8E8),
                                    width: 1.5),
                              ),
                              child: const Center(
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                    color: _darkText,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ── Stats Row ──────────────────
                  _buildStatsCard(),

                  const SizedBox(height: 14),

                  // ── About Me ───────────────────
                  _buildAboutMe(),

                  const SizedBox(height: 14),

                  // ── Details Section ────────────
                  _buildDetailsSection(),

                  const SizedBox(height: 14),

                  // ── Update Status Button ────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: _updateStatus,
                      child: Container(
                        width: double.infinity,
                        padding:
                        const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFD0D8E8),
                            width: 1.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_note_outlined,
                                size: 20, color: _darkText),
                            SizedBox(width: 8),
                            Text(
                              'Update Status',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: _darkText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          // ── Bottom Navigation Bar ────────────
          _buildBottomNav(),
        ],
      ),
    );
  }

  // ── Banner + Avatar ────────────────────────────────────────────────────────
  Widget _buildBannerSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Banner
        Container(
          height: 160,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1548802673-380ab8ebc7b7?w=800',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Avatar (centred, overlapping banner bottom)
        Positioned(
          bottom: -45,
          child: Stack(
            children: [
              // Outer glow ring
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4AB8E8), Color(0xFF2196F3)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _accentBlue.withOpacity(0.4),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
              // White inner ring
              Positioned(
                top: 3,
                left: 3,
                child: Container(
                  width: 94,
                  height: 94,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
              // Avatar image / placeholder
              Positioned(
                top: 5,
                left: 5,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: const Color(0xFFD0E8F5),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Color(0xFF7BB8D4),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Stats Card ─────────────────────────────────────────────────────────────
  Widget _buildStatsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            _StatItem(
              value: '$_projectCount',
              label: 'PROJECTS',
            ),
            _VerticalDivider(),
            _StatItem(
              value: _followerCount >= 1000
                  ? '${(_followerCount / 1000).toStringAsFixed(1)}k'
                  : '$_followerCount',
              label: 'FOLLOWERS',
            ),
            _VerticalDivider(),
            const _StatItem(value: '2y', label: 'EXPERIENCE'),
          ],
        ),
      ),
    );
  }

  // ── About Me ───────────────────────────────────────────────────────────────
  Widget _buildAboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Me',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: _darkText,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color(0xFFDDE4F0), width: 1),
              ),
              child: const Text(
                'Passionate UI/UX designer dedicated to building seamless, '
                    'high-performance applications. I specialize in creating '
                    'intuitive user interfaces and robust user experiences. '
                    "When I'm not designing, I'm exploring the latest design "
                    'trends and mentoring the next generation of designers.',
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xFF4A5568),
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Details Section ────────────────────────────────────────────────────────
  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 12),
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: _darkText,
              ),
            ),
          ),
          _DetailTile(
            icon: Icons.school_outlined,
            label: 'Department',
            value: 'Software Engineering',
          ),
          const SizedBox(height: 10),
          _DetailTile(
            icon: Icons.badge_outlined,
            label: 'Student ID',
            value: '232-134-009',
          ),
          const SizedBox(height: 10),
          _DetailTile(
            icon: Icons.calendar_today_outlined,
            label: 'Batch',
            value: '5th Batch',
          ),
          const SizedBox(height: 10),
          _DetailTile(
            icon: Icons.email_outlined,
            label: 'Email Address',
            value: 'muradd4200@gmail.com',
          ),
        ],
      ),
    );
  }

  // ── Bottom Navigation Bar ──────────────────────────────────────────────────
  Widget _buildBottomNav() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 12,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_outlined, label: 'Home', active: false),
          _NavItem(
              icon: Icons.search_outlined, label: 'Search', active: false),
          _NavItem(
              icon: Icons.favorite_border_outlined,
              label: 'Activity',
              active: false),
          _NavItem(icon: Icons.person, label: 'Profile', active: true),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Helper Widgets
// ─────────────────────────────────────────────

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1F2E),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8A94A6),
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 1,
      color: const Color(0xFFE4EAF4),
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon box
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(icon, size: 20, color: const Color(0xFF4A6FA5)),
            ),
          ),
          const SizedBox(width: 14),
          // Label + value
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF8A94A6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1F2E),
                  ),
                ),
              ],
            ),
          ),
          // Arrow
          const Icon(Icons.chevron_right,
              size: 20, color: Color(0xFFB0BAC9)),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _NavItem(
      {required this.icon, required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    final color = active ? const Color(0xFF4AB8E8) : const Color(0xFF8A94A6);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: active ? 48 : null,
          height: active ? 36 : null,
          decoration: active
              ? BoxDecoration(
            color: const Color(0xFF4AB8E8),
            borderRadius: BorderRadius.circular(20),
          )
              : null,
          padding: active
              ? const EdgeInsets.symmetric(horizontal: 14)
              : EdgeInsets.zero,
          child: Icon(icon, color: active ? Colors.white : color, size: 22),
        ),
        if (!active) ...[
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}