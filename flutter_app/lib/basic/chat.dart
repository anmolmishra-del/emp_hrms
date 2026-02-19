// /* ---------------------------------------------------
//    CHAT HOME SCREEN
// --------------------------------------------------- */

// import 'package:flutter/material.dart';

// class ChatHomeScreen extends StatelessWidget {
//   const ChatHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F2FB),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF8E7CF0),
//         title: const Text('Company Chat'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _sectionTitle('Company'),
//             _companyTile(context),

//             const SizedBox(height: 20),
//             _sectionTitle('Teams'),
//             _teamHorizontalList(context),

//             const SizedBox(height: 20),
//             _sectionTitle('Employees'),
//             _employeeList(context),
//           ],
//         ),
//       ),
//     );
//   }

//   /* -------------------- COMPANY -------------------- */

//   Widget _companyTile(BuildContext context) {
//     return _chatTile(
//       context,
//       title: 'Company Announcements',
//       subtitle: 'All employees',
//       icon: Icons.campaign,
//       chatId: 'company',
//     );
//   }

//   /* -------------------- TEAMS (HORIZONTAL) -------------------- */

//   Widget _teamHorizontalList(BuildContext context) {
//     final teams = [
//       {'title': 'HR', 'icon': Icons.people, 'id': 'hr'},
//       {'title': 'Engineering', 'icon': Icons.code, 'id': 'engineering'},
//       {'title': 'Finance', 'icon': Icons.attach_money, 'id': 'finance'},
//       {'title': 'Sales', 'icon': Icons.trending_up, 'id': 'sales'},
//     ];

//     return SizedBox(
//       height: 110,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: teams.length,
//         separatorBuilder: (_, __) => const SizedBox(width: 12),
//         itemBuilder: (context, index) {
//           final team = teams[index];
//           return GestureDetector(
//             onTap: () => _openChat(
//               context,
//               team['title'] as String,
//               team['id'] as String,
//             ),
//             child: Container(
//               width: 140,
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: const [
//                   BoxShadow(color: Colors.black12, blurRadius: 6),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: const Color(0xFF8E7CF0),
//                     child: Icon(team['icon'] as IconData, color: Colors.white),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     team['title'] as String,
//                     style: const TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /* -------------------- EMPLOYEES (VERTICAL) -------------------- */

//   Widget _employeeList(BuildContext context) {
//     final employees = [
//       {'name': 'Alice', 'role': 'HR Executive', 'id': 'alice'},
//       {'name': 'Bob', 'role': 'Flutter Developer', 'id': 'bob'},
//       {'name': 'Charlie', 'role': 'Accountant', 'id': 'charlie'},
//       {'name': 'David', 'role': 'Sales Manager', 'id': 'david'},
//     ];

//     return Column(
//       children: employees
//           .map(
//             (e) => _chatTile(
//               context,
//               title: e['name']!,
//               subtitle: e['role']!,
//               icon: Icons.person,
//               chatId: e['id']!,
//             ),
//           )
//           .toList(),
//     );
//   }

//   /* -------------------- COMMON UI -------------------- */

//   Widget _sectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8),
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _chatTile(
//     BuildContext context, {
//     required String title,
//     required String subtitle,
//     required IconData icon,
//     required String chatId,
//   }) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundColor: const Color(0xFF8E7CF0),
//           child: Icon(icon, color: Colors.white),
//         ),
//         title: Text(title),
//         subtitle: Text(subtitle),
//         onTap: () => _openChat(context, title, chatId),
//       ),
//     );
//   }

//   void _openChat(BuildContext context, String title, String chatId) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => ChatScreen(chatTitle: title, chatId: chatId),
//       ),
//     );
//   }
// }

// /* ---------------------------------------------------
//    CHAT SCREEN
// --------------------------------------------------- */

// class ChatScreen extends StatefulWidget {
//   final String chatTitle;
//   final String chatId;

//   const ChatScreen({super.key, required this.chatTitle, required this.chatId});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();

//   final List<_ChatMessage> messages = [
//     _ChatMessage(
//       message: 'Welcome to the chat 👋',
//       isMe: false,
//       time: '09:00 AM',
//     ),
//   ];

//   void _sendMessage() {
//     if (_controller.text.trim().isEmpty) return;

//     setState(() {
//       messages.add(
//         _ChatMessage(message: _controller.text, isMe: true, time: 'Now'),
//       );
//       _controller.clear();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F2FB),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF8E7CF0),
//         title: Text(widget.chatTitle),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: messages.length,
//               itemBuilder: (_, index) =>
//                   _MessageBubble(message: messages[index]),
//             ),
//           ),
//           _MessageInput(controller: _controller, onSend: _sendMessage),
//         ],
//       ),
//     );
//   }
// }

// /* ---------------------------------------------------
//    MESSAGE MODEL
// --------------------------------------------------- */

// class _ChatMessage {
//   final String message;
//   final bool isMe;
//   final String time;

//   _ChatMessage({required this.message, required this.isMe, required this.time});
// }

// /* ---------------------------------------------------
//    MESSAGE BUBBLE
// --------------------------------------------------- */

// class _MessageBubble extends StatelessWidget {
//   final _ChatMessage message;

//   const _MessageBubble({required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: message.isMe ? const Color(0xFF8E7CF0) : Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               message.message,
//               style: TextStyle(
//                 color: message.isMe ? Colors.white : Colors.black,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               message.time,
//               style: TextStyle(
//                 fontSize: 10,
//                 color: message.isMe ? Colors.white70 : Colors.black45,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /* ---------------------------------------------------
//    MESSAGE INPUT
// --------------------------------------------------- */

// class _MessageInput extends StatelessWidget {
//   final TextEditingController controller;
//   final VoidCallback onSend;

//   const _MessageInput({required this.controller, required this.onSend});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       color: Colors.white,
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: 'Type a message...',
//                 filled: true,
//                 fillColor: const Color(0xFFF1EEFF),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(24),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.send, color: Color(0xFF8E7CF0)),
//             onPressed: onSend,
//           ),
//         ],
//       ),
//     );
//   }
// }
