import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  final Function(String) onNavigate;

  const Navbar({super.key, required this.onNavigate});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF1A2332).withOpacity(0.3),
            Colors.transparent,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo/Name - Hidden for clean look
            const SizedBox.shrink(),

            // Navigation Items
            if (!isMobile)
              Row(
                children: [
                  _NavItem(title: 'Home', onTap: () => widget.onNavigate('home')),
                  _NavItem(title: 'About', onTap: () => widget.onNavigate('about')),
                  _NavItem(title: 'Skills', onTap: () => widget.onNavigate('skills')),
                  _NavItem(title: 'Projects', onTap: () => widget.onNavigate('projects')),
                  _NavItem(title: 'Experience', onTap: () => widget.onNavigate('experience')),
                  _NavItem(title: 'Contact', onTap: () => widget.onNavigate('contact')),
                ],
              )
            else
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () => _showMobileMenu(context),
              ),
          ],
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A2332),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MobileNavItem(title: 'Home', onTap: () { Navigator.pop(context); widget.onNavigate('home'); }),
            _MobileNavItem(title: 'About', onTap: () { Navigator.pop(context); widget.onNavigate('about'); }),
            _MobileNavItem(title: 'Skills', onTap: () { Navigator.pop(context); widget.onNavigate('skills'); }),
            _MobileNavItem(title: 'Projects', onTap: () { Navigator.pop(context); widget.onNavigate('projects'); }),
            _MobileNavItem(title: 'Experience', onTap: () { Navigator.pop(context); widget.onNavigate('experience'); }),
            _MobileNavItem(title: 'Contact', onTap: () { Navigator.pop(context); widget.onNavigate('contact'); }),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              shadows: _isHovered
                  ? [
                const Shadow(
                  color: Color(0xFF00D9FF),
                  blurRadius: 10,
                ),
              ]
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MobileNavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}