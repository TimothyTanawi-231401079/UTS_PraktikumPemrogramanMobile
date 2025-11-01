import 'package:uts_pemmob/models/soal.dart';

class DummyData {
  static final List<Soal> daftar = [
    const Soal(
      id: '1',
      pertanyaan: 'Salah satu cara melakukan pemrograman mobile adalah menggunakan ...',
      pilihan1: 'Python',
      pilihan2: 'Flutter',
      pilihan3: 'HTML',
      pilihan4: 'Ruby',
      jawaban: '2'
    ),
    const Soal(
        id: '2',
        pertanyaan: 'Flutter dapat bekerja di platform ...',
        pilihan1: 'Android',
        pilihan2: 'iOS',
        pilihan3: 'Windows',
        pilihan4: 'Semua yang di atas',
        jawaban: '4'
    ),
    const Soal(
        id: '3',
        pertanyaan: 'Flutter menggunakan bahasa pemrograman...',
        pilihan1: 'C',
        pilihan2: 'Java',
        pilihan3: 'Dart',
        pilihan4: 'Python',
        jawaban: '3'
    ),
    const Soal(
        id: '4',
        pertanyaan: 'Salah satu keunggulan dari Flutter adalah ...',
        pilihan1: 'Pengembangan Single-Platform',
        pilihan2: 'Pengembangan Multi-Platform',
        pilihan3: 'Sederhana',
        pilihan4: 'Perlu biaya',
        jawaban: '2'
    ),
    const Soal(
        id: '5',
        pertanyaan: 'Konsep dasar dari Flutter adalah ...',
        pilihan1: 'Everything is a Widget',
        pilihan2: 'Everything is a Screen',
        pilihan3: 'Some things is a Widget',
        pilihan4: 'Everything is a Box',
        jawaban: '1'
    ),

  ];
}