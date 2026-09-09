import 'package:flutter/material.dart';
import 'dart:math' as math;

class HeroSection extends StatefulWidget {
  final VoidCallback? onContactPressed;
  const HeroSection({super.key, this.onContactPressed});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;
    final isTablet = screenSize.width >= 768 && screenSize.width < 1024;

    return Container(
      height: screenSize.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          // Background diagonal lines
          CustomPaint(
            size: Size(screenSize.width, screenSize.height),
            painter: DiagonalLinesPainter(),
          ),
          // Particles background
          CustomPaint(
            size: Size(screenSize.width, screenSize.height),
            painter: ParticlesPainter(),
          ),
          // Main content
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: isMobile
                  ? _buildMobileLayout(isMobile)
                  : _buildDesktopLayout(isMobile, isTablet),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextContent(isMobile, false),
          const SizedBox(height: 40),
          _buildPhoto(isMobile),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(bool isMobile, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 40 : 80, vertical: 80),
      child: Row(
        children: [
          // Left side - Text content
          Expanded(
            flex: 5,
            child: _buildTextContent(isMobile, true),
          ),
          const SizedBox(width: 60),
          // Right side - Photo
          Expanded(
            flex: 4,
            child: _buildPhoto(isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(bool isMobile, bool isDesktop) {
    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Name with Gradient (ORIGINAL STYLE)
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
          ).createShader(bounds),
          child: Text(
            'I\'m Muhammed Jasim k a',
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 28 : 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 15),

        // Job Title (ORIGINAL STYLE)
        Text(
          'Flutter Developer',
          textAlign: isDesktop ? TextAlign.left : TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 20 : 28,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 30),

        // Skill Tags (ORIGINAL STYLE)
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _SkillTag(
              label: 'Flutter',
              color: const Color(0xFF00D9FF),
              isMobile: isMobile,
            ),
            _SkillTag(
              label: 'Dart',
              color: const Color(0xFFFF006B),
              isMobile: isMobile,
            ),
            _SkillTag(
              label: 'State Management',
              color: const Color(0xFFFF8C00),
              isMobile: isMobile,
            ),
          ],
        ),
        const SizedBox(height: 40),

        // CTA Buttons (ORIGINAL STYLE)
        Wrap(
          spacing: 15,
          runSpacing: 15,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _GradientButton(
              text: 'Contact Me',
              icon: Icons.mail_outline,
              onPressed: widget.onContactPressed ?? () {},
              isMobile: isMobile,
            ),
            _OutlineButton(
              text: 'Download CV',
              icon: Icons.download_outlined,
              onPressed: () {},
              isMobile: isMobile,
            ),
          ],
        ),
        const SizedBox(height: 50),

        // Social Links (ORIGINAL STYLE)
        Wrap(
          spacing: 20,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            _SocialIcon(icon: Icons.code, label: 'LinkedIn'),
            _SocialIcon(icon: Icons.work_outline, label: 'GitHub'),
            _SocialIcon(icon: Icons.email_outlined, label: 'Email'),
          ],
        ),
      ],
    );
  }

  Widget _buildPhoto(bool isMobile) {
    return Container(
      height: isMobile ? 400 : 550,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          'assets/profile.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF2A3F5F),
              child: const Icon(
                Icons.person,
                size: 100,
                color: Color(0xFF00D9FF),
              ),
            );
          },
        ),
      ),
    );
  }
}

// ORIGINAL STYLE WIDGETS - NO CHANGES

class _SkillTag extends StatelessWidget {
  final String label;
  final Color color;
  final bool isMobile;

  const _SkillTag({
    required this.label,
    required this.color,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 8 : 12,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: color, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: isMobile ? 12 : 16,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isMobile;

  const _GradientButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: isMobile ? 18 : 20),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 32,
            vertical: isMobile ? 14 : 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(
            fontSize: isMobile ? 14 : 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _OutlineButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isMobile;

  const _OutlineButton({
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: isMobile ? 18 : 20),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF00D9FF), width: 2),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: isMobile ? 14 : 18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        foregroundColor: const Color(0xFF00D9FF),
        textStyle: TextStyle(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String label;

  const _SocialIcon({required this.icon, required this.label});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF00D9FF) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovered
                ? [
              BoxShadow(
                color: const Color(0xFF00D9FF).withOpacity(0.4),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ]
                : [],
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? Colors.white : const Color(0xFF1A2332),
            size: 24,
          ),
        ),
      ),
    );
  }
}

// Background painters
class DiagonalLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFF6B6B).withOpacity(0.1)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final orangePaint = Paint()
      ..color = const Color(0xFFFF8C00).withOpacity(0.15)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Diagonal lines
    canvas.drawLine(
      Offset(0, size.height * 0.2),
      Offset(size.width, size.height * 0.4),
      orangePaint,
    );

    canvas.drawLine(
      Offset(0, size.height * 0.6),
      Offset(size.width, size.height * 0.8),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ParticlesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00D9FF).withOpacity(0.1)
      ..strokeWidth = 2;

    final random = math.Random(42);
    for (int i = 0; i < 50; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}