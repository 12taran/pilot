import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilot_project/data/models/board_member.dart';
import 'package:pilot_project/routes/api_routes.dart';

class FlipCard extends StatefulWidget {
  final int index;
  final Member boardMember;

  const FlipCard({
    super.key,
    required this.index,
    required this.boardMember,
  });

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isFront = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _flipCard() {
    if (isFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isFront = !isFront;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * math.pi;
          final isUnder = angle > math.pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(angle),
            child: isUnder ? _buildBack() : _buildFront(),
          );
        },
      ),
    );
  }

  Widget _buildFront() {
    return Container(
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(255, 211, 223, 212),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  // Ensure height matches width for a perfect circle
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(
                          '${ApiRoutes.imageRoutes}${widget.boardMember.image!}'),
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire container
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: Get.width * 0.02),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.boardMember.name!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.actor(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: const Color.fromARGB(255, 26, 24, 24),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.boardMember.designation!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.actor(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(255, 31, 31, 31),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBack() {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.278,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 222, 240, 224),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "More Info",
              style: GoogleFonts.actor(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Details about ${widget.boardMember.name} like bio, achievements, etc. go here.",
              textAlign: TextAlign.center,
              style: GoogleFonts.actor(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
