// lib/eventModels.dart

class EventModel {
  final int id;
  final String title;
  final String organizer;
  final String date;
  final String location;
  final String category;
  final String description;
  final int price;
  int quota;
  final double rating;
  final String imageUrl;
  final String eventUrl;
  bool isBookmark;

  EventModel({
    required this.id,
    required this.title,
    required this.organizer,
    required this.date,
    required this.location,
    required this.category,
    required this.description,
    required this.price,
    required this.quota,
    required this.rating,
    required this.imageUrl,
    required this.eventUrl,
    this.isBookmark = false,
  });
}

List<EventModel> eventList = [
  EventModel(
    id: 1,
    title: "Sound of Jakarta Music Festival 2026",
    organizer: "Harmoni Indonesia Live",
    date: "15 Oktober 2026",
    location: "Gelora Bung Karno, Jakarta",
    category: "Concert",
    description: "Festival musik terbesar tahun ini yang menghadirkan kolaborasi musisi papan atas nasional dan internasional dalam satu panggung megah. Nikmati pengalaman konser bertema teknologi pencahayaan futuristik dan panggung immersive.",
    price: 350000,
    quota: 15,
    rating: 4.9,
    imageUrl: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?q=80&w=1000",
    eventUrl: "https://id.wikipedia.org/wiki/Konser_musik",
  ),

  EventModel(
    id: 2,
    title: "Indonesia Tech & AI Summit 2026",
    organizer: "Digital Nusantara Tech",
    date: "20 November 2026",
    location: "ICE BSD City, Tangerang",
    category: "Seminar",
    description: "Konferensi teknologi terbesar di Indonesia yang membahas perkembangan Artificial Intelligence, Machine Learning, dan Cloud Architecture. Menghadirkan pembicara ahli dari perusahaan teknologi global.",
    price: 150000,
    quota: 8,
    rating: 4.8,
    imageUrl: "https://images.unsplash.com/photo-1540575467063-178a50c2df87?q=80&w=1000",
    eventUrl: "https://id.wikipedia.org/wiki/Kecerdasan_buatan",
  ),

  EventModel(
    id: 3,
    title: "Flutter & Mobile App Dev Bootcamp",
    organizer: "DevCode Academy",
    date: "05 Desember 2026",
    location: "Online via Zoom & YouTube Live",
    category: "Workshop",
    description: "Workshop intensif hands-on membangun aplikasi mobile modern dari dasar menggunakan Flutter dan Dart. Peserta akan mempelajari manajemen state, integrasi API, hingga pengujian dan deployment aplikasi.",
    price: 75000,
    quota: 25,
    rating: 4.7,
    imageUrl: "https://images.unsplash.com/photo-1531482615713-2afd69097998?q=80&w=1000",
    eventUrl: "https://en.wikipedia.org/wiki/Flutter_(software)",
  ),

  EventModel(
    id: 4,
    title: "Contemporary Art & Culture Exhibition",
    organizer: "Galeri Seni Merdeka",
    date: "12 Januari 2027",
    location: "Museum Nasional, Jakarta",
    category: "Exhibition",
    description: "Pameran karya seni kontemporer dari seniman muda berbakat seluruh Nusantara. Menampilkan lukisan, instalasi digital 3D, hingga pertunjukan seni interaktif yang mengusung tema pelestarian budaya lokal.",
    price: 50000,
    quota: 30,
    rating: 4.6,
    imageUrl: "https://images.unsplash.com/photo-1531243269054-5ebf6f34081e?q=80&w=1000",
    eventUrl: "https://id.wikipedia.org/wiki/Pameran_seni",
  ),

  EventModel(
    id: 5,
    title: "National Startup Pitching & Career Expo",
    organizer: "Nusantara Incubator",
    date: "18 Februari 2027",
    location: "Grand Ballroom Hotel Indonesia, Jakarta",
    category: "Exhibition",
    description: "Ajang bagi para founder startup untuk memperluas jaringan investasi sekaligus bursa kerja teknologi terbesar. Dapatkan kesempatan pitching di depan investor terkemuka dan ikuti sesi kurasi karir.",
    price: 0,
    quota: 50,
    rating: 4.8,
    imageUrl: "https://images.unsplash.com/photo-1515187029135-18ee286d815b?q=80&w=1000",
    eventUrl: "https://id.wikipedia.org/wiki/Perusahaan_rintisan",
  ),

  EventModel(
    id: 6,
    title: "UI/UX Design Masterclass: Crafting Product",
    organizer: "DesignHub Indonesia",
    date: "02 Maret 2027",
    location: "Bandung Creative Hub, Bandung",
    category: "Workshop",
    description: "Pelajari tata cara merancang antarmuka (UI) dan pengalaman pengguna (UX) yang ramah pengguna, berstandar industri, serta berbasis riset perilaku pengguna terkini bersama para praktisi UI/UX senior.",
    price: 120000,
    quota: 5,
    rating: 4.9,
    imageUrl: "https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?q=80&w=1000",
    eventUrl: "https://en.wikipedia.org/wiki/User_experience_design",
  ),

  EventModel(
    id: 7,
    title: "Indie Indie Night Concert Vol. 4",
    organizer: "Ruang Rungsa Collective",
    date: "25 Maret 2027",
    location: "Taman Ismail Marzuki, Jakarta",
    category: "Concert",
    description: "Malam selebrasi musik independen lokal yang menghadirkan band-band indie indie kenamaan tanah air. Rasakan kehangatan panggung akustik dan instalasi visual bernuansa retro.",
    price: 200000,
    quota: 10,
    rating: 4.7,
    imageUrl: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?q=80&w=1000",
    eventUrl: "https://id.wikipedia.org/wiki/Musik_independen",
  ),

  EventModel(
    id: 8,
    title: "Cyber Security & Data Privacy Forum",
    organizer: "CyberGuard ID",
    date: "10 April 2027",
    location: "Online via Zoom",
    category: "Seminar",
    description: "Diskusi mendalam mengenai keamanan siber, enkripsi data, penanganan insiden pertetangan siber, serta regulasi perlindungan data pribadi di era transformasi digital.",
    price: 90000,
    quota: 20,
    rating: 4.8,
    imageUrl:
        "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?q=80&w=1000",
    eventUrl: "https://id.wikipedia.org/wiki/Keamanan_komputer",
  ),
];
