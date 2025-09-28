import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr/core/helper/result_card.dart';
import 'package:qr/core/utlis/assets.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultComponents extends StatelessWidget {
  const ResultComponents({super.key});

  bool _isURL(String text) {
    final uri = Uri.tryParse(text);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  void _openURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("scans")
            .snapshots(),
            
           

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No scans yet"));
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data() as Map<String, dynamic>;
              final result = data["result"] ?? "";
              final isLink = _isURL(result);

              return GestureDetector(
                onTap: isLink ? () => _openURL(result) : null,
                child: ResultCard(
                  resulttext: result,
                  image: AssetsData.p32,
                  isLink: isLink,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
