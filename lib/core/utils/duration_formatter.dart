String durationToString(Duration duration, {format = "mm:ss"}) {
  String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, "0");
  String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, "0");

  return "$minutes:$seconds";
}
