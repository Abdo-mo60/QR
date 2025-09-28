import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.resulttext,
    this.image,
    this.isLink = false,
  });

  final String resulttext;
  final image;
  final bool isLink;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isLink) {
          // نسخ النص لو مش رابط
          Clipboard.setData(ClipboardData(text: resulttext));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Copied to clipboard")),
          );
        }
        // لو الرابط محتاج فتح، ممكن تضيف هنا فتح الرابط مباشرة
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xffF4F4F4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Image.asset(image),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Text(
                resulttext,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 15,
                  color: isLink ? Colors.blue : Colors.black,
                  decoration:
                      isLink ? TextDecoration.underline : TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
