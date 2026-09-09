import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
      color: const Color(0xFF000000), // Full black
      child: Column(
        children: [
          // Section Title
          Text(
            ' My Skills ',
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
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 60),
          // Skills Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile
                  ? 2
                  : constraints.maxWidth > 1200
                  ? 4
                  : 3;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 0.9 : 1.2,
                ),
                itemCount: _skills.length,
                itemBuilder: (context, index) {
                  return _SkillCard(skill: _skills[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SkillCard extends StatefulWidget {
  final Skill skill;

  const _SkillCard({required this.skill});

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: _isHovered ? Colors.blue : Colors.transparent,
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.skill.icon,
              size: 50,
              color: _isHovered ? Colors.blue : Colors.white,
            ),
            const SizedBox(height: 15),
            Text(
              widget.skill.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _isHovered ? Colors.blue : Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: widget.skill.proficiency / 100,
              backgroundColor: Colors.white12,
              valueColor: AlwaysStoppedAnimation<Color>(
                _isHovered ? Colors.purple : Colors.blue,
              ),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.skill.proficiency}%',
              style: TextStyle(
                fontSize: 14,
                color: _isHovered ? Colors.blue : const Color(0xFFB0B0B0),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Skill {
  final String name;
  final IconData icon;
  final int proficiency;

  Skill({
    required this.name,
    required this.icon,
    required this.proficiency,
  });
}

final List<Skill> _skills = [
  Skill(name: 'Flutter', icon: Icons.flutter_dash, proficiency: 95),
  Skill(name: 'Dart', icon: Icons.code, proficiency: 90),
  Skill(name: 'Firebase', icon: Icons.cloud, proficiency: 85),
  Skill(name: 'REST API', icon: Icons.api, proficiency: 88),
  Skill(name: 'State Management', icon: Icons.build, proficiency: 90),
  Skill(name: 'UI/UX Design', icon: Icons.design_services, proficiency: 82),
  Skill(name: 'Git', icon: Icons.code_off, proficiency: 85),
  Skill(name: 'Responsive Design', icon: Icons.devices, proficiency: 92),
];