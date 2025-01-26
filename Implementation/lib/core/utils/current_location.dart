/// Captures the current location in the code (file name and line number).
///
/// This function uses the `StackTrace` class to get the current stack trace
/// and extracts the details of the frame where the function is called.
/// It returns a string containing the file name and line number.
///
/// Parameters:
/// - [isTryCatch]: A boolean indicating whether the function is called within `tryCatch`.
///   If true, it skips the first two frames (getCurrentLocation and tryCatch).
///   If false, it skips only the first frame (getCurrentLocation).
///
/// The purpose of skipping frames is to accurately capture the location
/// where the `tryCatch` function is called, rather than where `getCurrentLocation`
/// itself is called. This helps in logging or debugging the exact location
/// of the code that is being executed and threw an exception.
///
/// Returns:
/// A string representing the file name and line number of the caller location.
String getCurrentLocation({bool isTryCatch = true}) {
  final stackTrace = StackTrace.current;
  final frames = stackTrace.toString().split('\n');
  final frameIndex = isTryCatch ? 2 : 1;
  if (frames.length > frameIndex) {
    final frame = frames[
        frameIndex]; // Skip the first frame (getCurrentLocation) and second frame (tryCatch) if isTryCatch is true
    final location =
        frame.substring(frame.indexOf('(') + 1, frame.indexOf(')'));
    return location;
  }
  return 'Unknown location';
}
