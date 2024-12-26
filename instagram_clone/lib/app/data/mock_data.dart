class MockData {
  static final List<Map<String, dynamic>> stories = [
    {
      'username': 'your_story',
      'imageUrl': 'https://picsum.photos/200',
      'userImage': 'https://picsum.photos/200',
      'isViewed': false,
      'hasStory': true,
      'timeAgo': '1h',
    },
    {
      'username': 'john_doe',
      'imageUrl': 'https://picsum.photos/201',
      'userImage': 'https://picsum.photos/201',
      'isViewed': false,
      'hasStory': true,
      'timeAgo': '2h',
    },
    {
      'username': 'jane_smith',
      'imageUrl': 'https://picsum.photos/202',
      'userImage': 'https://picsum.photos/202',
      'isViewed': true,
      'hasStory': true,
      'timeAgo': '3h',
    },
    {
      'username': 'mike_wilson',
      'imageUrl': 'https://picsum.photos/203',
      'userImage': 'https://picsum.photos/203',
      'isViewed': false,
      'hasStory': true,
      'timeAgo': '4h',
    },
    {
      'username': 'sarah_jones',
      'imageUrl': 'https://picsum.photos/204',
      'userImage': 'https://picsum.photos/204',
      'isViewed': false,
      'hasStory': true,
      'timeAgo': '5h',
    },
  ];

  static final List<Map<String, dynamic>> posts = [
    {
      'id': 'post1',
      'username': 'john_doe',
      'userImage': 'https://picsum.photos/201',
      'location': 'New York, USA',
      'imageUrl': 'https://picsum.photos/500/500',
      'caption': 'Living my best life! 🌟 #NewYork #Life',
      'likes': 1234,
      'comments': 56,
      'timeAgo': '2 heures',
      'isLiked': false,
      'isBookmarked': false,
    },
    {
      'id': 'post2',
      'username': 'jane_smith',
      'userImage': 'https://picsum.photos/202',
      'location': 'Paris, France',
      'imageUrl': 'https://picsum.photos/501/501',
      'caption': 'Paris is always a good idea 🗼 #Paris #Travel',
      'likes': 2345,
      'comments': 78,
      'timeAgo': '4 heures',
      'isLiked': false,
      'isBookmarked': false,
    },
    {
      'id': 'post3',
      'username': 'mike_wilson',
      'userImage': 'https://picsum.photos/203',
      'location': 'Tokyo, Japan',
      'imageUrl': 'https://picsum.photos/502/502',
      'caption': 'Exploring Tokyo! 🗼 #Tokyo #Adventure',
      'likes': 3456,
      'comments': 90,
      'timeAgo': '6 heures',
      'isLiked': false,
      'isBookmarked': false,
    },
    {
      'id': 'post4',
      'username': 'sarah_jones',
      'userImage': 'https://picsum.photos/204',
      'location': 'London, UK',
      'imageUrl': 'https://picsum.photos/503/503',
      'caption': 'London calling ☎️ #London #UK',
      'likes': 4567,
      'comments': 123,
      'timeAgo': '8 heures',
      'isLiked': false,
      'isBookmarked': false,
    },
    {
      'id': 'post5',
      'username': 'alex_brown',
      'userImage': 'https://picsum.photos/205',
      'location': 'Sydney, Australia',
      'imageUrl': 'https://picsum.photos/504/504',
      'caption': 'Beach day! 🏖 #Sydney #Beach',
      'likes': 5678,
      'comments': 145,
      'timeAgo': '10 heures',
      'isLiked': false,
      'isBookmarked': false,
    },
  ];

  static final Map<String, dynamic> currentUser = {
    'username': 'thisisfranknz',
    'fullName': 'Franck Nz',
    'bio': '05 May 🎉\nprogramming enthusiast 👨‍💻\nMy 🌍 = Me + My goals.',
    'profileImage': 'https://picsum.photos/200',
    'followers': 1847,
    'following': 949,
    'posts': 1,
  };

  static final List<Map<String, dynamic>> users = [
    {
      'username': 'john_doe',
      'fullName': 'John Doe',
      'profileImage': 'https://picsum.photos/201',
      'isOnline': true,
    },
    {
      'username': 'jane_smith',
      'fullName': 'Jane Smith',
      'profileImage': 'https://picsum.photos/202',
      'isOnline': false,
    },
    {
      'username': 'mike_wilson',
      'fullName': 'Mike Wilson',
      'profileImage': 'https://picsum.photos/203',
      'isOnline': true,
    },
    {
      'username': 'sarah_jones',
      'fullName': 'Sarah Jones',
      'profileImage': 'https://picsum.photos/204',
      'isOnline': false,
    },
    {
      'username': 'alex_brown',
      'fullName': 'Alex Brown',
      'profileImage': 'https://picsum.photos/205',
      'isOnline': true,
    },
  ];

  static final List<Map<String, dynamic>> comments = [
    {
      'id': 'comment1',
      'postId': 'post1',
      'username': 'jane_smith',
      'userImage': 'https://picsum.photos/202',
      'text': 'Amazing photo! 😍',
      'likes': 24,
      'timeAgo': '1h',
      'isLiked': false,
    },
    {
      'id': 'comment2',
      'postId': 'post1',
      'username': 'mike_wilson',
      'userImage': 'https://picsum.photos/203',
      'text': 'Love this place!',
      'likes': 12,
      'timeAgo': '2h',
      'isLiked': false,
    },
    {
      'id': 'comment3',
      'postId': 'post2',
      'username': 'john_doe',
      'userImage': 'https://picsum.photos/201',
      'text': 'Great shot! 👍',
      'likes': 34,
      'timeAgo': '3h',
      'isLiked': false,
    },
    {
      'id': 'comment4',
      'postId': 'post2',
      'username': 'sarah_jones',
      'userImage': 'https://picsum.photos/204',
      'text': 'Beautiful city! 🌆',
      'likes': 45,
      'timeAgo': '4h',
      'isLiked': false,
    },
  ];

  static final List<Map<String, dynamic>> conversations = [
    {
      'id': 'conv1',
      'participants': ['thisisfranknz', 'john_doe'],
      'lastMessage': 'Hey, how are you?',
      'lastMessageTime': '5m',
      'unreadCount': 2,
      'messages': [
        {
          'id': 'msg1',
          'senderId': 'john_doe',
          'text': 'Hey, how are you?',
          'timestamp': '2024-12-26T00:00:00.000Z',
          'isRead': false,
        },
        {
          'id': 'msg2',
          'senderId': 'thisisfranknz',
          'text': 'Hi! I\'m good, thanks!',
          'timestamp': '2024-12-26T00:01:00.000Z',
          'isRead': true,
        },
      ],
    },
    {
      'id': 'conv2',
      'participants': ['thisisfranknz', 'jane_smith'],
      'lastMessage': 'See you tomorrow!',
      'lastMessageTime': '1h',
      'unreadCount': 0,
      'messages': [
        {
          'id': 'msg3',
          'senderId': 'jane_smith',
          'text': 'See you tomorrow!',
          'timestamp': '2024-12-25T23:00:00.000Z',
          'isRead': true,
        },
        {
          'id': 'msg4',
          'senderId': 'thisisfranknz',
          'text': 'Perfect, can\'t wait!',
          'timestamp': '2024-12-25T23:01:00.000Z',
          'isRead': true,
        },
      ],
    },
  ];
}
