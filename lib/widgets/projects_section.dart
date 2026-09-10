import 'package:flutter/material.dart';

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? demoUrl;
  final String? codeUrl;
  final List<Color> gradientColors;
  final IconData icon;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.demoUrl,
    this.codeUrl,
    required this.gradientColors,
    required this.icon,
  });
}

final List<Project> _projects = [
  const Project(
    title: 'Futurix Partner Portal',
    description:
        'An enterprise mobile app that streamlines referral sales operations with real-time lead tracking, project enquiry management, financial transparency, and commission tracking.',
    technologies: ['React Native', 'Expo', 'TypeScript', 'Redux', 'REST API'],
    gradientColors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
    icon: Icons.business_center_rounded,
  ),
  const Project(
    title: 'CareLoom Telehealth & RPM',
    description:
        'A digital health & telehealth mobile app that optimizes chronic disease management with real-time vital sign logging, fl_chart trend visualization, doctor messaging, and care plans.',
    technologies: ['Flutter', 'Dart', 'fl_chart', 'REST API', 'JWT Auth', 'Telehealth'],
    gradientColors: [Color(0xFF147B6A), Color(0xFF06B6D4)],
    icon: Icons.health_and_safety_rounded,
  ),
  const Project(
    title: 'Zyfit Gym & Fitness',
    description:
        'A cross-platform fitness & gym management app built with Flutter and REST APIs delivering personalized AI workout plans, QR attendance tracking, and real-time analytics.',
    technologies: ['Flutter', 'Dart', 'REST API', 'JWT Auth', 'Firebase FCM', 'Custom Painter'],
    gradientColors: [Color(0xFFFF512F), Color(0xFFDD2476)],
    icon: Icons.fitness_center_rounded,
  ),
  const Project(
    title: 'Airbnb Clone (Capstone)',
    description:
        'A complete vacation rental booking app featuring property listings, interactive booking workflows, navigation, and form validation across 5+ screens.',
    technologies: ['Flutter', 'Dart', 'State Management', 'Firebase', 'Clean Arch'],
    gradientColors: [Color(0xFFFF385C), Color(0xFFE61E4D)],
    icon: Icons.home_work_rounded,
  ),
  const Project(
    title: 'TrenCart E-Commerce',
    description:
        'A feature-rich Flutter shopping application with product catalogs, smart filter & search, cart management, Provider state management, and checkout flow.',
    technologies: ['Flutter', 'Dart', 'Provider', 'Firebase', 'Payment Gateway'],
    gradientColors: [Color(0xFF059669), Color(0xFF0D9488)],
    icon: Icons.shopping_bag_rounded,
  ),
];

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
          SizedBox(height: isMobile ? 20 : 30),
          // Subtitle
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
            ).createShader(bounds),
            child: Text(
              'My Projects',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 28 : 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.3,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          // Project Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: _projects.map((project) {
                  final cardWidth = isMobile
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 30) / 2;
                  return SizedBox(
                    width: cardWidth,
                    child: _ProjectCard(project: project, isMobile: isMobile),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final bool isMobile;

  const _ProjectCard({
    required this.project,
    required this.isMobile,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isMobile ? 440 : 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: widget.project.gradientColors,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.project.gradientColors.first.withOpacity(0.5),
                    blurRadius: 40,
                    spreadRadius: 10,
                  ),
                ]
              : [
                  BoxShadow(
                    color: widget.project.gradientColors.first.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.all(widget.isMobile ? 25 : 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon Header
                Container(
                  width: widget.isMobile ? 70 : 85,
                  height: widget.isMobile ? 70 : 85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    widget.project.icon,
                    size: widget.isMobile ? 38 : 46,
                    color: widget.project.gradientColors.first,
                  ),
                ),
                SizedBox(height: widget.isMobile ? 20 : 25),
                // Title
                Text(
                  widget.project.title,
                  style: TextStyle(
                    fontSize: widget.isMobile ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                // Description
                Text(
                  widget.project.description,
                  style: TextStyle(
                    fontSize: widget.isMobile ? 13 : 15,
                    color: Colors.white.withOpacity(0.95),
                    height: 1.5,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                // Tech tags
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.project.technologies
                      .map((tech) => _TechTag(label: tech, isMobile: widget.isMobile))
                      .toList(),
                ),
                const Spacer(),
                // Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, size: 18),
                      label: const Text('View Demo'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: widget.project.gradientColors.first,
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16 : 20,
                          vertical: widget.isMobile ? 12 : 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(
                          fontSize: widget.isMobile ? 13 : 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.code, size: 18),
                      label: const Text('Code'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.isMobile ? 16 : 20,
                          vertical: widget.isMobile ? 12 : 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(
                          fontSize: widget.isMobile ? 13 : 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TechTag extends StatelessWidget {
  final String label;
  final bool isMobile;

  const _TechTag({required this.label, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 10 : 12,
        vertical: isMobile ? 5 : 6,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: isMobile ? 11 : 13,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}