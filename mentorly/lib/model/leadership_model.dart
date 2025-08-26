class LeaderShipUser {
  final String userName;
  final int level;
  
  final int xpPoints;
  final String? avatarUrl;

  LeaderShipUser({
    required this.userName,
    required this.level,
     
    required this.xpPoints,
    this.avatarUrl,
  });
}
