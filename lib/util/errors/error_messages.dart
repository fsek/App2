class ErrorMessage {
  static const Map<String, String> LoadingErrors = {
    "SERIAL": "Requested Device not found in database",
    "SIM": "No SIM-card registered for this device",
    "AUTH": "You are not authorized to configure this device",
  };
  static const Map<String, String> ConfigurationErrors = {
    "SERIAL": "Requested Device not found in database",
    "AUTH":  "You are not authorized to configure this device",
    "SIM_CHANGE": "An error occured while toggling SIM",
    "RESOURCE_FORMAT": "An internal error occured while configuring Resources.",
    "RESOURCE_INVALID": "An internal error occured while configuring Resources.",
  };
}