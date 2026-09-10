import 'package:flutter/material.dart';

class ExperienceItem {
  final String title;
  final String organization;
  final String period;
  final String description;
  final List<String> bulletPoints;
  final IconData icon;

  const ExperienceItem({
    required this.title,
    required this.organization,
    required this.period,
    required this.description,
    required this.bulletPoints,
    required this.icon,
  });
}

final List<ExperienceItem> _workExperience = [
  const ExperienceItem(
    title: 'Flutter Developer Intern',
    organization: 'Habbiton Labs Pvt Ltd',
    period: '6 Months (Completed)',
    description:
        'Built production-level mobile application features adhering to MVVM and clean architecture principles.',
    bulletPoints: [
      'Developed and maintained features in production Flutter applications using MVVM and clean architecture principles.',
      'Integrated REST APIs, Firebase services, and local storage (SQLite/Hive) into live app modules.',
      'Wrote unit and widget tests, and supported app build/deployment workflows (CI/CD).',
      'Worked with native platform channels for Android/iOS-specific functionality.',
      'Collaborated via Git/GitHub using branches and pull requests in a team workflow.',
    ],
    icon: Icons.work_rounded,
  ),
  const ExperienceItem(
    title: 'Flutter Developer Training',
    organization: 'Luminar Technolab, Kochi',
    period: 'Completed, 2025',
    description:
        'Completed structured project-based training covering Dart, Flutter architecture, and state management.',
    bulletPoints: [
      'Completed a structured, project-based training program covering Dart fundamentals, Flutter architecture, state management (Provider, Bloc, GetX, Riverpod), and Firebase integration.',
      'Built and deployed a complete Flutter capstone application (Airbnb Clone).',
    ],
    icon: Icons.school_rounded,
  ),
];

final List<ExperienceItem> _education = [
  const ExperienceItem(
    title: 'Diploma in Mechanical Engineering',
    organization: 'MET\'s School of Engineering, Mala, Thrissur',
    period: '2021 – 2024',
    description: '3-year Technical Diploma Education',
    bulletPoints: [],
    icon: Icons.school_outlined,
  ),
  const ExperienceItem(
    title: 'Higher Secondary (Commerce)',
    organization: 'P. Bhaskaran Memorial Govt. HSS, Kodungallur',
    period: '2019 – 2021',
    description: 'Higher Secondary Education',
    bulletPoints: [],
    icon: Icons.history_edu_rounded,
  ),
  const ExperienceItem(
    title: 'SSLC',
    organization: 'St. Anne\'s High School, Kottapuram',
    period: '2019',
    description: 'Secondary School Leaving Certificate',
    bulletPoints: [],
    icon: Icons.workspace_premium_rounded,
  ),
];

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 60 : 100,
      ),
      color: const Color(0xFF000000),
      child: Column(
        children: [
          // Section Title
          Text(
            'Experience & Education',
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 4,
            width: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),

          // Work Experience Header
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: const [
                Icon(Icons.badge_rounded, color: Color(0xFF00D9FF), size: 28),
                SizedBox(width: 12),
                Text(
                  'Work Experience',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          ..._workExperience.asMap().entries.map((entry) {
            return _TimelineCard(
              item: entry.value,
              isLast: entry.key == _workExperience.length - 1,
              isMobile: isMobile,
            );
          }),

          const SizedBox(height: 50),

          // Education Header
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: const [
                Icon(Icons.school_rounded, color: Color(0xFF00D9FF), size: 28),
                SizedBox(width: 12),
                Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          ..._education.asMap().entries.map((entry) {
            return _TimelineCard(
              item: entry.value,
              isLast: entry.key == _education.length - 1,
              isMobile: isMobile,
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineCard extends StatefulWidget {
  final ExperienceItem item;
  final bool isLast;
  final bool isMobile;

  const _TimelineCard({
    required this.item,
    required this.isLast,
    required this.isMobile,
  });

  @override
  State<_TimelineCard> createState() => _TimelineCardState();
}

class _TimelineCardState extends State<_TimelineCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(bottom: 25),
        padding: EdgeInsets.all(widget.isMobile ? 20 : 30),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? const Color(0xFF00D9FF) : Colors.transparent,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF00D9FF).withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.item.title,
                    style: TextStyle(
                      fontSize: widget.isMobile ? 18 : 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D9FF).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF00D9FF).withOpacity(0.4),
                    ),
                  ),
                  child: Text(
                    widget.item.period,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF00D9FF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  widget.item.icon,
                  size: 18,
                  color: const Color(0xFF00D9FF),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.item.organization,
                  style: TextStyle(
                    fontSize: widget.isMobile ? 14 : 16,
                    color: const Color(0xFFB0B0B0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            if (widget.item.bulletPoints.isNotEmpty) ...[
              const SizedBox(height: 15),
              ...widget.item.bulletPoints.map(
                (point) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 7),
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00D9FF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          point,
                          style: TextStyle(
                            fontSize: widget.isMobile ? 13 : 15,
                            color: const Color(0xFFD0D0D0),
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}