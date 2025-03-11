import 'package:flutter/material.dart';
import 'api_service.dart';
import 'models.dart';

class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  late Future<List<Data>> futurePosts;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    futurePosts = apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[800],
      ),
      body: FutureBuilder<List<Data>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]!),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 50, color: Colors.red),
                  SizedBox(height: 10),
                  Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                'No data available',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Data data = snapshot.data![index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.article, size: 20, color: Colors.blue[800]),
                            SizedBox(width: 8),
                            Text(
                              'Data #${data.id}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          data.title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        SizedBox(height: 8),
                        Text(
                          data.body,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}