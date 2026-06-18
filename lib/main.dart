import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile UI',
      theme: ThemeData(
        fontFamily: 'Poppins',
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
  String status =
      "Passionate UI/UX designer dedicated to building seamless, high-performance applications. I specialize in creating intuitive user interfaces and robust user experiences.";

  bool updated = false;

  void updateStatus() {
    setState(() {
      if (!updated) {
        status =
        "Creative UI/UX Designer focused on user-centered design, mobile app interfaces, and modern digital experiences.";
        updated = true;
      } else {
        status =
        "Passionate UI/UX designer dedicated to building seamless, high-performance applications. I specialize in creating intuitive user interfaces and robust user experiences.";
        updated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F5FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Color(0xff001A66),
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xff001A66),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.settings,
              color: Color(0xff001A66),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // Cover + Profile Image
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [

                Container(
                  height: 190,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/cover.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  bottom: -50,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xff23B8FF),
                        width: 3,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(
                        "assets/images/profile.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 65),

            // Name
            const Center(
              child: Text(
                "Murad Hussain",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "UI/UX Designer",
              style: TextStyle(
                fontSize: 22,
                color: Color(0xff001A66),
              ),
            ),

            const SizedBox(height: 30),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff43C6F9),
                            Color(0xff005EA8),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(.25),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xff001A66),
                        ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          "Message",
                          style: TextStyle(
                            color: Color(0xff001A66),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Statistics
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [

                  Expanded(
                    child: statItem("12", "PROJECTS"),
                  ),

                  Expanded(
                    child: statItem("1.2k", "FOLLOWERS"),
                  ),

                  Expanded(
                    child: statItem("2y", "EXPERIENCE"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // About Me
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      status,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [

                  detailTile(
                    Icons.school,
                    "Department",
                    "Software Engineering",
                  ),

                  detailTile(
                    Icons.badge,
                    "Student ID",
                    "232-134-009",
                  ),

                  detailTile(
                    Icons.calendar_month,
                    "Batch",
                    "5th Batch",
                  ),

                  detailTile(
                    Icons.email_outlined,
                    "Email Address",
                    "muradd4200@gmail.com",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // setState Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton.icon(
                  onPressed: updateStatus,
                  icon: const Icon(Icons.edit_note),
                  label: const Text(
                    "Update Status",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget statItem(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            letterSpacing: 1,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget detailTile(
      IconData icon,
      String title,
      String value,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffEEF3FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffDDE7FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xff001A66),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}