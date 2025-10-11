double safeRatio(num numerator, num denominator) {
  if (denominator == 0) {
    return numerator == 0 ? 1.0 : numerator.toDouble();
  }
  return numerator / denominator;
}
