import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subject: 'Програмирање на видео игри', dateTime: DateTime(2026, 1, 15, 9, 0), rooms: ['117', 'Lab 215']),
    Exam(subject: 'Алгоритми и податочни структури', dateTime: DateTime(2026, 1, 18, 10, 0), rooms: ['Lab 2']),
    Exam(subject: 'Бази на податоци', dateTime: DateTime(2026, 1, 20, 12, 0), rooms: ['Lab 12']),
    Exam(subject: 'Оперативни системи', dateTime: DateTime(2026, 1, 23, 9, 30), rooms: ['Lab 13']),
    Exam(subject: 'Компјутерски мрежи', dateTime: DateTime(2026, 1, 25, 13, 0), rooms: ['Lab 138']),
    Exam(subject: 'Интернет технологии', dateTime: DateTime(2026, 1, 27, 10, 30), rooms: ['AMF FINKI']),
    Exam(subject: 'Вештачка интелигенција', dateTime: DateTime(2026, 2, 1, 8, 0), rooms: ['AMF MF']),
    Exam(subject: 'Рударење на масовни податоци', dateTime: DateTime(2026, 2, 3, 11, 0), rooms: ['Lab 3']),
    Exam(subject: 'Математика 2', dateTime: DateTime(2025, 10, 22, 9, 0), rooms: ['AMF FINKI']),
    Exam(subject: 'Мобилни информациски системи', dateTime: DateTime(2025, 10, 28, 10, 0), rooms: ['117']),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        title: const Text(
          'Распоред за испити - 221557',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
            ),
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.green.shade700,
        padding: const EdgeInsets.all(12),
        child: Text(
          'Вкупно испити: ${exams.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
