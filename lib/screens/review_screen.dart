import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewScreen extends StatefulWidget {
  final String title;
  final String imageUrl;

  const ReviewScreen({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  TextEditingController _reviewController = TextEditingController();
  double _rating = 0; // Inisialisasi rating

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.imageUrl,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              'Write your review:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your review here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            RatingBar.builder(
              initialRating: _rating, // Rating awal
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Tambahkan logika untuk mengirim ulasan ke backend atau melakukan tindakan lain sesuai kebutuhan Anda
                String review = _reviewController.text;
                // Lakukan sesuatu dengan ulasan, seperti mengirimkannya ke server
                // Di sini Anda juga bisa menambahkan logika untuk menyimpan ulasan ke penyimpanan lokal atau melakukan tindakan lain.
                print('Review submitted: $review');
                print('Rating submitted: $_rating');
                Navigator.pop(context);
              },
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
