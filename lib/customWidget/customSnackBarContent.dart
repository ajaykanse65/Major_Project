import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({Key? key, required this.errorText}) : super(key: key);
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            const SizedBox(
              width: 48,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Oh snap!',
                    style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    errorText,
                    style:
                    const TextStyle(fontSize: 14, color: Colors.white),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius:
          const BorderRadius.only(bottomLeft: Radius.circular(20)),
          child: SvgPicture.asset(
            "assets/icons/bubbles.svg",
            height: 48,
            width: 40,
            color: const Color(0xFF801336),
          ),
        ),
      ),
      Positioned(
          top: -10,
          left: 0,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              'assets/icons/fail.svg',
              height: 30,
              width: 10,
            ),
            Positioned(
              top: 5,
              child: SvgPicture.asset(
                'assets/icons/close.svg',
                height: 15,
              ),
            )
          ]))
    ]);
  }
}

class CustomSuccessContent extends StatelessWidget {
  const CustomSuccessContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        height: 70,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Color(0xFF23a25b),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            const SizedBox(
              width: 48,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                   Text(
                    'Well done!',
                    style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold,),
                  ),
                  Text(
                    'You have login Successfully...🤩',
                    style:
                    const TextStyle(fontSize: 14, color: Colors.white,),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius:
          const BorderRadius.only(bottomLeft: Radius.circular(20)),
          child: SvgPicture.asset(
            "assets/icons/successbubbles.svg",
            height: 48,
            width: 40,
            color: const Color(0xFF1d4f2f),
          ),
        ),
      ),
      Positioned(
          top: -10,
          left: 0,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              'assets/icons/success.svg',
              height: 30,
              width: 10,
              color: const Color(0xFF1d4f2f),
            ),
            Positioned(
              top: 5,
              child: SvgPicture.asset(
                'assets/icons/done.svg',
                height: 18,
              ),
            )
          ]))
    ]);
  }
}

