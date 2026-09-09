// import 'package:flutter/material.dart';
//
// class ExperienceSection extends StatelessWidget {
//   const ExperienceSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     final isMobile = screenSize.width < 768;
//
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 60,
//         vertical: isMobile ? 60 : 100,
//       ),
//       color: const Color(0xFF000000), // Full black
//       child: Column(
//         children: [
//           // Section Title
//           Text(
//             'Experience',
//             style: TextStyle(
//               fontSize: isMobile ? 32 : 48,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 10),
//           Container(
//             height: 4,
//             width: 80,
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Colors.blue, Colors.purple],
//               ),
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),
//           SizedBox(height: isMobile ? 40 : 60),
//           // Timeline
//           ..._experiences.asMap().entries.map((entry) {
//             final index = entry.key;
//             final experience = entry.value;
//             return _TimelineItem(
//               experience: experience,
//               isLast: index == _experiences.length - 1,
//               isMobile: isMobile,
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
//
// class _TimelineItem extends StatefulWidget {
//   final Experience experience;
//   final bool isLast;
//   final bool isMobile;
//
//   const _TimelineItem({
//     required this.experience,
//     required this.isLast,
//     required this.isMobile,
//   });
//
//   @override
//   State<_TimelineItem> createState() => _TimelineItemState();
// }
//
// class _TimelineItemState extends State<_TimelineItem> {
//   bool _isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: IntrinsicHeight(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Timeline indicator
//             Column(
//               children: [
//                 AnimatedContainer(
//                   duration: const Duration(milliseconds: 300),
//                   width: 20,
//                   height: 20,
//                   decoration: BoxDecoration(
//                     color: _isHovered ? Colors.blue : Colors.transparent,
//                     border: Border.all(color: Colors.blue, width: 3),
//                     shape: BoxShape.circle,
//                     boxShadow: _isHovered
//                         ? [
//                       BoxShadow(
//                         color: Colors.blue.withOpacity(0.5),
//                         blurRadius: 10,
//                         spreadRadius: 2,
//                       ),
//                     ]
//                         : [],
//                   ),
//                 ),
//                 if (!widget.isLast)
//                   Expanded(
//                     child: Container(
//                       width: 2,
//                       color: Colors.blue.withOpacity(0.3),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(width: 30),
//             // Content
//             Expanded(
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 margin: const EdgeInsets.only(bottom: 40),
//                 padding: EdgeInsets.all(widget.isMobile ? 20 : 30),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF1A1A1A),
//                   borderRadius: BorderRadius.circular(15),
//                   border: Border.all(
//                     color: _isHovered ? Colors.blue : Colors.transparent,
//                     width: 2,
//                   ),
//                   boxShadow: _isHovered
//                       ? [
//                     BoxShadow(
//                       color: Colors.blue.withOpacity(0.2),
//                       blurRadius: 20,
//                       offset: const Offset(0, 10),
//                     ),
//                   ]
//                       : [],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Period
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12,
//                         vertical: 6,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.blue.withOpacity(0.3)),
//                       ),
//                       child: Text(
//                         widget.experience.period,
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     // Title
//                     Text(
//                       widget.experience.title,
//                       style: TextStyle(
//                         fontSize: widget.isMobile ? 20 : 24,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     // Company
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.business,
//                           size: 16,
//                           color: Color(0xFFB0B0B0),
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           widget.experience.company,
//                           style: TextStyle(
//                             fontSize: widget.isMobile ? 14 : 16,
//                             color: const Color(0xFFB0B0B0),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 15),
//                     // Description
//                     Text(
//                       widget.experience.description,
//                       style: TextStyle(
//                         fontSize: widget.isMobile ? 14 : 16,
//                         color: const Color(0xFFB0B0B0),
//                         height: 1.6,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     // Achievements
//                     ...widget.experience.achievements.map(
//                           (achievement) => Padding(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               margin: const EdgeInsets.only(top: 8),
//                               width: 6,
//                               height: 6,
//                               decoration: const BoxDecoration(
//                                 color: Colors.blue,
//                                 shape: BoxShape.circle,
//                               ),
//                             ),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 achievement,
//                                 style: TextStyle(
//                                   fontSize: widget.isMobile ? 13 : 15,
//                                   color: const Color(0xFF909090),
//                                   height: 1.5,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Experience {
//   final String title;
//   final String company;
//   final String period;
//   final String description;
//   final List<String> achievements;
//
//   Experience({
//     required this.title,
//     required this.company,
//     required this.period,
//     required this.description,
//     required this.achievements,
//   });
// }
//
// final List<Experience> _experiences = [
//   Experience(
//     title: 'Senior Flutter Developer',
//     company: 'Tech Solutions Inc.',
//     period: '2022 - Present',
//     description:
//     'Leading the development of cross-platform mobile applications for enterprise clients, managing a team of developers, and implementing best practices.',
//     achievements: [
//       'Architected and developed 5+ production-ready Flutter applications',
//       'Reduced app loading time by 40% through performance optimization',
//       'Mentored junior developers and conducted code reviews',
//       'Implemented CI/CD pipeline for automated testing and deployment',
//     ],
//   ),
//   Experience(
//     title: 'Flutter Developer',
//     company: 'Digital Innovations Ltd.',
//     period: '2020 - 2022',
//     description:
//     'Developed and maintained multiple mobile applications with focus on user experience and code quality. Collaborated with design and backend teams.',
//     achievements: [
//       'Built and launched 8+ mobile applications on iOS and Android',
//       'Integrated third-party APIs and payment gateways',
//       'Improved app performance and reduced crash rate by 60%',
//       'Implemented state management using Provider and BLoC patterns',
//     ],
//   ),
//   Experience(
//     title: 'Junior Mobile Developer',
//     company: 'StartUp Ventures',
//     period: '2019 - 2020',
//     description:
//     'Started career in mobile development, focusing on learning Flutter framework and contributing to various startup projects.',
//     achievements: [
//       'Developed UI components and screens for mobile applications',
//       'Fixed bugs and implemented new features based on user feedback',
//       'Learned and applied Flutter best practices and design patterns',
//       'Collaborated with team members using Git and Agile methodologies',
//     ],
//   ),
// ];