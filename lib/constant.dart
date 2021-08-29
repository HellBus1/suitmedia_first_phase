import 'dart:math';

import 'package:intl/intl.dart';
import 'package:suitmedia_first_phase/model/event.dart';

List<Event> eventList = [
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/POSTER-BATCH-03-01-720x405.jpg',
    name: 'Online Training ISO Series',
    date: DateTime.now(),
    latitude: 6.200000,
    longitude: 106.816666,
  ),
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/PAI-CPD-WEBINAR-2021-16-720x405.jpg',
    name: 'Workshop Barista Series',
    date: DateFormat('yyyy-MM-dd – kk:mm').parseLoose('2022-08-12 20:00'),
    latitude: 7.161367,
    longitude: 113.482498,
  ),
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/IMG_20210709_102237-600x405.jpg',
    name:
        'JABAR TIATEX EXPO 2021 (Pameran Perdagangan, Perindustrian, Pariwisata, Investasi dan Perikanan Pertanian)',
    date: DateFormat('yyyy-MM-dd – kk:mm').parseLoose('2022-09-11 20:00'),
    latitude: 5.548290,
    longitude: 95.323753,
  ),
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/IMG_20210709_101113-600x405.jpg',
    name:
        'SOLO LEADING INDUSTRY EXPO 2021 (Pameran Perdagangan, Perindustrian, Pariwisata, Investasi dan Pertanian Perikanan)',
    date: DateTime.now(),
    latitude: 3.654703,
    longitude: 128.190643,
  ),
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/toba-talks-12-A-1-720x405.jpg',
    name: 'Cara Membuat Konten Instagram Juara Toba.ai Challenge',
    date: DateFormat('yyyy-MM-dd – kk:mm').parseLoose('2022-07-05 20:00'),
    latitude: 2.994494,
    longitude: 120.195465,
  ),
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/IMG-20210703-WA0012-719x405.jpg',
    name: 'Sharing Gigi Sehat Senyum Hebat 3',
    date: DateFormat('yyyy-MM-dd – kk:mm').parseLoose('2021-12-12 20:00'),
    latitude: 7.025253,
    longitude: 107.519760,
  ),
  new Event(
    image:
        'https://jadwalevent.web.id/wp-content/uploads/2021/07/210892957_498789604727646_1826314193580926305_n-720x405.jpg',
    name: 'Virtual Job Fair Bantul 2021',
    date: DateTime.now(),
    latitude: 1.694394,
    longitude: 101.445007,
  ),
];
