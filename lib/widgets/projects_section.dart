import 'package:flutter/material.dart';

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
          // Section Title
          // Text(
          //   'Portfolio',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(
          //     fontSize: isMobile ? 32 : 48,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
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
          // Subtitle
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
            ).createShader(bounds),
            child: Text(
              'My Projects',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 24 : 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1.3,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 40 : 80),
          // Project Cards
          if (isMobile)
            Column(
              children: [
                _AirbnbCard(isMobile: true),
                const SizedBox(height: 30),
                _PortfolioWebsiteCard(isMobile: true),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _AirbnbCard(isMobile: false),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: _PortfolioWebsiteCard(isMobile: false),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

// Airbnb Card (Left)
class _AirbnbCard extends StatefulWidget {
  final bool isMobile;

  const _AirbnbCard({required this.isMobile});

  @override
  State<_AirbnbCard> createState() => _AirbnbCardState();
}

class _AirbnbCardState extends State<_AirbnbCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isMobile ? 400 : 550,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF385C), Color(0xFFE61E4D)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: const Color(0xFFFF5A5F).withOpacity(0.5),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ]
              : [
            BoxShadow(
              color: const Color(0xFFFF5A5F).withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.all(widget.isMobile ? 30 : 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Airbnb Logo
                Container(
                  width: widget.isMobile ? 80 : 100,
                  height: widget.isMobile ? 80 : 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/6/69/Airbnb_Logo_B%C3%A9lo.svg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.home_work_rounded,
                        size: 50,
                        color: Color(0xFFFF5A5F),
                      );
                    },
                  ),
                ),
                SizedBox(height: widget.isMobile ? 25 : 30),
                // Title
                Text(
                  'Airbnb Clone',
                  style: TextStyle(
                    fontSize: widget.isMobile ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                // Description
                Text(
                  'A full-featured vacation rental platform with property listings, booking system, user authentication, and payment integration.',
                  style: TextStyle(
                    fontSize: widget.isMobile ? 14 : 16,
                    color: Colors.white.withOpacity(0.95),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 25),
                // Technologies
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _TechTag(label: 'Flutter', isMobile: widget.isMobile),
                    _TechTag(label: 'Firebase', isMobile: widget.isMobile),
                    _TechTag(label: 'Maps API', isMobile: widget.isMobile),
                    _TechTag(label: 'Payment', isMobile: widget.isMobile),
                  ],
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
                        foregroundColor: const Color(0xFFFF385C),
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

// Portfolio Website Card (Right)
class _PortfolioWebsiteCard extends StatefulWidget {
  final bool isMobile;

  const _PortfolioWebsiteCard({required this.isMobile});

  @override
  State<_PortfolioWebsiteCard> createState() => _PortfolioWebsiteCardState();
}

class _PortfolioWebsiteCardState extends State<_PortfolioWebsiteCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: widget.isMobile ? 400 : 550,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: const Color(0xFF00D9FF).withOpacity(0.5),
              blurRadius: 40,
              spreadRadius: 10,
            ),
          ]
              : [
            BoxShadow(
              color: const Color(0xFF00D9FF).withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            padding: EdgeInsets.all(widget.isMobile ? 30 : 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Web Icon
                Container(
                  width: widget.isMobile ? 80 : 100,
                  height: widget.isMobile ? 80 : 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.web,
                    size: 50,
                    color: Color(0xFF00D9FF),
                  ),
                ),
                SizedBox(height: widget.isMobile ? 25 : 30),
                // Title
                Text(
                  'Portfolio Website',
                  style: TextStyle(
                    fontSize: widget.isMobile ? 24 : 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                // Description
                Text(
                  'Personal portfolio website built with modern web technologies showcasing projects, skills, and professional experience.',
                  style: TextStyle(
                    fontSize: widget.isMobile ? 14 : 16,
                    color: Colors.white.withOpacity(0.95),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 25),
                // Technologies
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _TechTag(label: 'HTML', isMobile: widget.isMobile),
                    _TechTag(label: 'CSS', isMobile: widget.isMobile),
                    _TechTag(label: 'JavaScript', isMobile: widget.isMobile),
                    _TechTag(label: 'Responsive', isMobile: widget.isMobile),
                  ],
                ),
                const Spacer(),
                // Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.launch, size: 18),
                      label: const Text('Visit Site'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF00D9FF),
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
                      label: const Text('Source'),
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