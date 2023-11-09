import 'package:flutter/material.dart';
import 'package:heal_tec/src/core/theme/colors.dart';

class Medicines extends StatelessWidget {
  const Medicines({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(20),
        ),
        padding:
            const EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 22),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final Medicine medicine = medicines[index];
            return Container(
              padding: EdgeInsets.only(
                top: 19,
                left: 20,
                right: 20,
                bottom: index == 3 ? 0 : 19,
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: '${medicine.name}(',
                      style: const TextStyle(
                        color: black,
                        fontSize: 16,
                        height: 20.83 / 16,
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: medicine.company,
                          style: const TextStyle(
                            color: darkGrey,
                            fontSize: 16,
                            height: 20.83 / 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const TextSpan(text: ')'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${medicine.dozeSize} ml',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 18.23 / 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const DotedDivider(),
          itemCount: medicines.length,
        ),
      );
}

class DotedDivider extends StatelessWidget {
  const DotedDivider({super.key});

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size(MediaQuery.sizeOf(context).width, 1),
        painter: DotPainter(),
      );
}

class DotPainter extends CustomPainter {
  int dotSize = 4;
  double dotHeight = 1;
  int gap = 4;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFA4A4A4)
      ..strokeWidth = dotHeight
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.stroke;
    int i = 0;
    while (i < size.width) {
      final Offset p1 = Offset(i.toDouble(), 0);
      final Offset p2 = Offset((i + gap).toDouble(), 0);
      canvas.drawLine(p1, p2, paint);
      i = i + 2 * gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class Medicine {
  Medicine({required this.name, required this.company, this.dozeSize = 50});
  String name;
  String company;
  double dozeSize;
}

List<Medicine> medicines = <Medicine>[
  Medicine(name: 'Alprazolm', company: 'Xanax'),
  Medicine(name: 'Chlordiazepoxide', company: 'Librium', dozeSize: 100),
  Medicine(name: 'Diazepam', company: 'Valium'),
  Medicine(name: 'Lorazepam', company: 'Ativan'),
];
