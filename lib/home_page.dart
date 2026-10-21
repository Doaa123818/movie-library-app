import 'package:flutter/material.dart';
import 'movie.dart';
import 'movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showGrid = false;
  String _searchText = '';
  int _discount = 20;

  @override
  Widget build(BuildContext context) {
    final search = _searchText.trim().toLowerCase();
    final filteredMovies = movies.where((movie) {
      return movie.title.toLowerCase().contains(search) ||
          movie.genre.toLowerCase().contains(search);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Library'),
        centerTitle: false,
        actions: [
          IconButton(
            tooltip: _showGrid ? 'Switch to list' : 'Switch to grid',
            onPressed: () {
              setState(() {
                _showGrid = !_showGrid;
              });
            },
            icon: Icon(_showGrid ? Icons.view_list : Icons.grid_view),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search movies...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: filteredMovies.isEmpty
                ? const Center(child: Text('No movies found', style: TextStyle(fontSize: 16)))
                : _showGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.fromLTRB(12, 4, 12, 16),
                        itemCount: filteredMovies.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 4,
                          childAspectRatio: 0.62,
                        ),
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filteredMovies[index],
                            isGrid: true,
                            discount: _discount,
                            onDiscountTap: _decreaseDiscount,
                          );
                        },
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 12),
                        itemCount: filteredMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: filteredMovies[index],
                            isGrid: false,
                            discount: _discount,
                            onDiscountTap: _decreaseDiscount,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  void _decreaseDiscount() {
    setState(() {
      if (_discount > 0) {
        _discount--;
      }
    });
  }
}
