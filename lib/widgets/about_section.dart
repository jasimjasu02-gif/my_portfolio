import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;

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
            'About Me',
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
          // Content
          if (isMobile)
            Column(
              children: [
                _buildImage(),
                const SizedBox(height: 40),
                _buildContent(isMobile),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isTablet ? 1 : 2,
                  child: _buildImage(),
                ),
                SizedBox(width: isTablet ? 40 : 80),
                Expanded(
                  flex: 3,
                  child: _buildContent(false),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00D9FF).withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Flutter Developer & Mobile App Engineer',
          style: TextStyle(
            fontSize: isMobile ? 20 : 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Flutter Developer with 6 months of hands-on industry experience building production mobile applications using Dart, Flutter, and MVVM/clean architecture.',
          style: TextStyle(
            fontSize: isMobile ? 15 : 17,
            color: const Color(0xFFD0D0D0),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'Skilled in state management (Provider, Bloc, GetX, Riverpod), REST API integration, Firebase, local storage (SQLite, Hive), unit/widget testing, and CI/CD workflows.',
          style: TextStyle(
            fontSize: isMobile ? 15 : 17,
            color: const Color(0xFFB0B0B0),
            height: 1.7,
          ),
        ),
        const SizedBox(height: 25),
        Wrap(
          spacing: 30,
          runSpacing: 20,
          children: const [
            _StatItem(
              number: '6 Months',
              label: 'Industry Experience',
            ),
            _StatItem(
              number: '4+',
              label: 'State Mgmt Stack',
            ),
            _StatItem(
              number: '4+',
              label: 'Production Apps',
            ),
          ],
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String number;
  final String label;

  const _StatItem({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ).createShader(bounds),
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFFB0B0B0),
          ),
        ),
      ],
    );
  }
}