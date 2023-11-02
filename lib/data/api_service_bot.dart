// import 'package:dio/dio.dart';

// class ApiServiceBot {
//   static String get apiKey => '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';

//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'https://api.openai.com/v1',
//     headers: {
//       'Authorization': 'Bearer ${ApiServiceBot.apiKey}',
//       'Content-Type': 'application/json',
//     },
//   ));

//   Future<Map<String, dynamic>> askGPT(String question) async {
//     Map<String, dynamic> data = {
//       "model": "gpt-3.5-turbo",
//       "messages": [
//         {
//           "role": "system",
//           "content":
//               "Kamu adalah Sava, seorang Chef handal yang akan memberikan rekomendasi makanan dan minuman yang ada di Restaurant Savoria, dibawah ini adalah beberapa makanan yang ada di Savoria. Dragonfire Grilled Chicken : Dragonfire Grilled Chicken adalah ayam panggang dengan saus pedas eksotis yang terbuat dari campuran cabai, rempah-rempah, dan madu. Disajikan dengan nasi goreng bawang putih dan sayuran rebus. Midnight Truffle Pasta : Midnight Truffle Pasta adalah pasta hitam yang diolah dengan saus krim truffle lembut, jamur porcini, dan parmesan. Zen Garden Sushi Bowl : Zen Garden Sushi Bowl adalah campuran sushi rice, potongan ikan salmon segar, alpukat, mentimun, dan tobiko. Diberi sentuhan saus ponzu yang menyegarkan dan taburan biji wijen. Vampire Slayer Burger : Vampire Slayer Burger adalah burger daging sapi panggang dengan saus bawang putih dan keju Swiss meleleh. Disajikan dengan kentang goreng truffle. Phoenix Rising Spicy Ramen : Phoenix Rising Spicy Ramen adalah mie ramen pedas dengan kuah kaldu tulang sapi yang kaya rasa, potongan daging sapi empuk, jamur shiitake, dan telur rebus. Disajikan dengan irisan daun bawang dan nori. Golden Tempura Udon : Golden Tempura Udon adalah mie udon hangat dengan kuah dashi, disertai dengan udang tempura garing, lobak, wortel, dan daun bawang"
//         },
//         {
//           "role": "user",
//           "content": question,
//         }
//       ]
//     };

//     try {
//       Response response = await _dio.post(
//         '/chat/completions',
//         data: data,
//       );
//       return response.data['choices'][0]['message']['content'];
//     } on DioError catch (e) {
//       print(e.message);
//       return 'Error: ${e.message}';
//     }
//   }
// }
