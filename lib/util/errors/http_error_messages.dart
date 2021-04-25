class HttpErrorMessage {
  static const Map<int, String> Message = {
    // For 40X errors
    399: "We could not connect to Purplepoint Cloud. Please check your connection or try again later.",
    401: "You are not authenticated. Please log in again.",
    // For 50X errors
    499: "There was an error handling your request. Please try again later or contact an administrator.",
    503: "F-sek is down for maintenance"
  };
}