import 'package:flutter/cupertino.dart';

class ExampleCandidateModel {
  final String name;
  final String job;
  final String city;
  final String image;
  final List<Color> color;

  ExampleCandidateModel({
    required this.name,
    required this.job,
    required this.city,
    required this.color,
    required this.image,
  });
}

final List<ExampleCandidateModel> candidates = [
  ExampleCandidateModel(
    name: 'One, 1',
    job: 'Developer',
    city: 'Areado',
    image: 'user1.jpg',
    color: const [Color(0xFFFF3868), Color(0xFFFFB49A)],
  ),
  ExampleCandidateModel(
    name: 'Two, 2',
    job: 'Manager',
    city: 'New York',
    image: 'user2.jpg',
    color: const [Color(0xFF736EFE), Color(0xFF62E4EC)],
  ),
  ExampleCandidateModel(
    name: 'Three, 3',
    job: 'Engineer',
    city: 'London',
    image: 'user3.jpg',
    color: const [Color(0xFF2F80ED), Color(0xFF56CCF2)],
  ),
  ExampleCandidateModel(
    name: 'Four, 4',
    job: 'Designer',
    city: 'Tokyo',
    image: 'user4.jpg',
    color: const [Color(0xFF0BA4E0), Color(0xFFA9E4BD)],
  ),
];
