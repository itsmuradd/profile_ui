import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ─────────────────────────────────────────────────────────────────────────────
//  App Root
// ─────────────────────────────────────────────────────────────────────────────
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF02569B)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Colour Tokens
// ─────────────────────────────────────────────────────────────────────────────
class AppColors {
  static const primaryBlue   = Color(0xFF02569B);
  static const gradientStart = Color(0xFF4AB8E8);
  static const surfaceLight  = Color(0xFFF8F9FF);
  static const surfaceCard   = Color(0xFFFFFFFF);
  static const lightBlueSurf = Color(0xFFEFF4FF);
  static const iconBg        = Color(0xFFD0E4FF);
  static const deepNavy      = Color(0xFF1A2340);
  static const bluegrey      = Color(0xFF5A6A85);
  static const mutedLabel    = Color(0xFF8A96AA);
  static const divider       = Color(0xFFE4EBF8);
}

// ─────────────────────────────────────────────────────────────────────────────
//  Profile Screen
// ─────────────────────────────────────────────────────────────────────────────
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing   = false;
  int  _followerCount = 1200;
  int  _projectCount  = 12;

  // setState #1 — Follow toggle
  void _toggleFollow() {
    setState(() {
      _isFollowing    = !_isFollowing;
      _followerCount  = _isFollowing ? 1201 : 1200;
    });
  }

  // setState #2 — Update Status (cycles project count as demo)
  void _updateStatus() {
    setState(() {
      _projectCount = _projectCount < 20 ? _projectCount + 1 : 12;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,

      // ── AppBar ───────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: AppColors.surfaceCard,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppColors.deepNavy,
          ),
          onPressed: () {},
        ),
        // FIX: title is "Profile" — not the user's name
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryBlue,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                size: 22,
                color: AppColors.deepNavy,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),

      // ── Body ─────────────────────────────────────────────────────────────
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1. Hero block: banner → avatar ring → name/role
                  _buildHeroBlock(),

                  const SizedBox(height: 22),

                  // 2. Follow / Message buttons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        // Follow — gradient
                        Expanded(
                          child: GestureDetector(
                            onTap: _toggleFollow,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: _isFollowing
                                      ? [
                                    AppColors.gradientStart
                                        .withValues(alpha: 0.75),
                                    AppColors.primaryBlue
                                        .withValues(alpha: 0.75),
                                  ]
                                      : [
                                    AppColors.gradientStart,
                                    AppColors.primaryBlue,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryBlue
                                        .withValues(alpha: 0.30),
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

                        // Message — outline
                        Expanded(
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceCard,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppColors.primaryBlue,
                                  width: 1.5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Message',
                                  style: TextStyle(
                                    color: AppColors.primaryBlue,
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

                  // 3. Stats card
                  _buildStatsCard(),

                  const SizedBox(height: 16),

                  // 4. About Me
                  _buildAboutMe(),

                  const SizedBox(height: 16),

                  // 5. Details
                  _buildDetailsSection(),

                  const SizedBox(height: 16),

                  // 6. Update Status
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: _updateStatus,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.divider,
                            width: 1.5,
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(
                          Icons.edit_note_outlined,
                          size: 20,
                          color: AppColors.deepNavy,
                        ),
                        SizedBox(width: 😎,
                          Text(
                            'Update Status',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.deepNavy,
                            ),
                          ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          // ── Bottom Nav ───────────────────────────────────────────────────
          _buildBottomNav(),
        ],
      ),
    );
  }

  // ── Hero block ────────────────────────────────────────────────────────────
  Widget _buildHeroBlock() {
    const double bannerHeight   = 160.0;
    const double avatarRadius   = 48.0;
    const double avatarDiameter = avatarRadius * 2;

    return SizedBox(
      height: bannerHeight + avatarRadius + 10 + 28 + 22,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Banner
          Positioned(
            top: 0, left: 0, right: 0,
            height: bannerHeight,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1548802673-380ab8ebc7b7?w=900',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // White base below banner
          Positioned(
            top: bannerHeight - avatarRadius,
            left: 0, right: 0, bottom: 0,
            child: Container(color: AppColors.surfaceLight),
          ),

          // Avatar ring — centred
          Positioned(
            top: bannerHeight - avatarRadius,
            left: 0, right: 0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Gradient glow ring
                  Container(
                    width: avatarDiameter + 8,
                    height: avatarDiameter + 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.gradientStart,
                          AppColors.primaryBlue,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withValues(alpha: 0.30),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  // White separator
                  Container(
                    width: avatarDiameter + 4,
                    height: avatarDiameter + 4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  // Avatar photo
                  CircleAvatar(
                    radius: avatarRadius,
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1603415526960-f7e0328c63b1?w=200',
                    ),
                    backgroundColor: AppColors.iconBg,
                  ),
                ],
              ),
            ),
          ),

          // Name + designation — below avatar
          Positioned(
            top: bannerHeight + avatarRadius + 10,
            left: 0, right: 0,
            child: const Column(
              children: [
                Text(
                  'Murad Hussain',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepNavy,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'UI/UX Designer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Stats card ────────────────────────────────────────────────────────────
  Widget _buildStatsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            _StatItem(value: '$_projectCount', label: 'PROJECTS'),
            _VertDivider(),
            _StatItem(
              value: _followerCount >= 1000
                  ? '${(_followerCount / 1000).toStringAsFixed(1)}k'
                  : '$_followerCount',
              label: 'FOLLOWERS',
            ),
            _VertDivider(),
            const _StatItem(value: '2y', label: 'EXPERIENCE'),
          ],
        ),
      ),
    );
  }

  // ── About Me ──────────────────────────────────────────────────────────────
  Widget _buildAboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
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
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.deepNavy,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.lightBlueSurf,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.divider, width: 1),
              ),
              child: const Text(
                'Passionate UI/UX designer dedicated to building seamless, '
                    'high-performance applications. I specialise in creating '
                    'intuitive user interfaces and robust user experiences. '
                    "When I'm not designing, I'm exploring the latest design "
                    'trends and mentoring the next generation of designers.',
                style: TextStyle(
                  fontSize: 13.5,
                  color: AppColors.bluegrey,
                  height: 1.65,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Details section ───────────────────────────────────────────────────────
  Widget _buildDetailsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 2, bottom: 12),
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.deepNavy,
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

  // ── Bottom nav ────────────────────────────────────────────────────────────
  Widget _buildBottomNav() {
    return Container(
      height: 68,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 12,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_outlined,            label: 'Home',     active: false),
          _NavItem(icon: Icons.search_outlined,           label: 'Search',   active: false),
          _NavItem(icon: Icons.favorite_border_outlined,  label: 'Activity', active: false),
          _NavItem(icon: Icons.person,                    label: 'Profile',  active: true),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  Helper Widgets
// ─────────────────────────────────────────────────────────────────────────────

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.deepNavy,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedLabel,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VertDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 38,
      color: AppColors.divider,
    );
  }
}

class _DetailTile extends StatelessWidget {
  final IconData icon;
  final String   label;
  final String   value;
  const _DetailTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.lightBlueSurf,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Row(
        children: [
          // Icon box
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(icon, size: 20, color: AppColors.primaryBlue),
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
                    color: AppColors.mutedLabel,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.deepNavy,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 20, color: AppColors.mutedLabel),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String   label;
  final bool     active;
  const _NavItem({required this.icon, required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    final color = active ? AppColors.primaryBlue : AppColors.mutedLabel;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Active tab: gradient pill; inactive: plain icon
        active
            ? Container(
          width: 50,
          height: 34,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.gradientStart, AppColors.primaryBlue],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 22),
        )
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
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
        ),
      ],
    );
  }
}