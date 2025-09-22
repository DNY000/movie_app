class PromotionEntity {
  final String id;
  final String code;
  final String? description;
  final double? discountPercent; // 0-100
  final double? discountAmount;
  final DateTime? validFrom;
  final DateTime? validTo;
  final int? usageLimit;
  final int usedCount;
  final int perUserLimit;
  final bool isActive;

  PromotionEntity({
    required this.id,
    required this.code,
    this.description,
    this.discountPercent,
    this.discountAmount,
    this.validFrom,
    this.validTo,
    this.usageLimit,
    this.usedCount = 0,
    this.perUserLimit = 1,
    this.isActive = true,
  });
}
