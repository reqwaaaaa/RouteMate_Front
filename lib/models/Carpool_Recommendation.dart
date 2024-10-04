class CarpoolRecommendation {
  final String userId;
  final double similarity;

  CarpoolRecommendation({
    required this.userId,
    required this.similarity,
  });

  factory CarpoolRecommendation.fromJson(Map<String, dynamic> json) {
    return CarpoolRecommendation(
      userId: json['user_id'], // 后端返回的用户ID
      similarity: json['trajectory_similarity'], // 后端返回的轨迹相似度
    );
  }
}
