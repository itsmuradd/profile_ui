import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE08C2A)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Top App Bar ──────────────────────────────────
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                  top: 48, left: 20, right: 20, bottom: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A2340),
                    ),
                  ),
                  Icon(Icons.dark_mode_outlined,
                      color: Color(0xFFE08C2A), size: 26),
                ],
              ),
            ),

            // ── Banner + Avatar + Name ───────────────────────
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                // Banner image
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // White background behind name block so it flows cleanly
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    height: 130,
                  ),
                ),

                // Avatar centred, half on banner / half on white
                Positioned(
                  top: 80,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 52,
                      backgroundColor: Color(0xFFE0E0E0),
                      child: Icon(Icons.person,
                          size: 56, color: Color(0xFFBDBDBD)),
                    ),
                  ),
                ),

                // Name + title below avatar
                Positioned(
                  top: 194,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: const [
                      Text(
                        'Murad Hussain',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A2340),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Software Engineering Student',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFE08C2A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Spacer so content starts below the overlap zone
            const SizedBox(height: 68),

            // ── Action Buttons ───────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _ActionButton(
                      icon: Icons.check,
                      label: 'Following',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: _ActionButton(
                      icon: Icons.chat_bubble_outline,
                      label: 'Message',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 10),
                  _ActionButton(
                    icon: Icons.phone_outlined,
                    label: '',
                    onTap: () {},
                    iconOnly: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ── Stats Card ───────────────────────────────────
            _Card(
              child: Row(
                children: [
                  _StatItem(value: '16', label: 'Projects'),
                  _Divider(),
                  _StatItem(value: '965', label: 'Followers'),
                  _Divider(),
                  _StatItem(value: '2+ Years', label: 'Experience'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ── About Me ─────────────────────────────────────
            _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.face_outlined,
                          color: Color(0xFFE08C2A), size: 22),
                      SizedBox(width: 8),
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A2340),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Passionate UI/UX Designer focused on crafting beautiful, '
                        'user-centered digital experiences. Skilled in Figma and '
                        'design systems, with a love for clean interfaces, '
                        'meaningful interactions, and pixel-perfect details.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF555F70),
                      height: 1.55,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ── Personal Details ─────────────────────────────
            _Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.badge_outlined,
                              color: Color(0xFFE08C2A), size: 22),
                          SizedBox(width: 8),
                          Text(
                            'Personal Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A2340),
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.edit_outlined,
                          size: 18, color: Color(0xFF9AA3B0)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _DetailRow(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'muradd4200@gmail.com',
                  ),
                  const Divider(height: 1, color: Color(0xFFF0F0F0)),
                  _DetailRow(
                    icon: Icons.fingerprint,
                    label: 'Student ID',
                    value: '232-134-009',
                  ),
                  const Divider(height: 1, color: Color(0xFFF0F0F0)),
                  _DetailRow(
                    icon: Icons.school_outlined,
                    label: 'Department',
                    value: 'Software Engineering',
                  ),
                  const Divider(height: 1, color: Color(0xFFF0F0F0)),
                  _DetailRow(
                    icon: Icons.layers_outlined,
                    label: 'Batch',
                    value: '5th',
                  ),
                  const Divider(height: 1, color: Color(0xFFF0F0F0)),
                  _DetailRow(
                    icon: Icons.location_on_outlined,
                    label: 'Current City',
                    value: 'Sylhet, Bangladesh',
                  ),
                  const Divider(height: 1, color: Color(0xFFF0F0F0)),
                  _DetailRow(
                    icon: Icons.account_balance_outlined,
                    label: 'Institution',
                    value: 'Metropolitan University Bangladesh',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ── Reusable Widgets ──────────────────────────────────────────────────────────

class _Card extends StatelessWidget {
  final Widget child;
  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool iconOnly;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 13,
          horizontal: iconOnly ? 18 : 0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F1F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF1A2340)),
            if (!iconOnly) ...[
              const SizedBox(width: 7),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A2340),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A2340),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF9AA3B0),
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 1,
      color: const Color(0xFFE8E8E8),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F7),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFFE08C2A)),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFFE08C2A),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1A2340),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}