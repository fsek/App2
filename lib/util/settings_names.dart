const Map<String, String> SettingsNames = {
  "RangeStart": "Min",
  "RangeEnd": "Max",
  "NotifyLevel": "Notify Level",
  "InitialValue": "Initial Value",
  "MaxDeviation": "Max Deviation",
  "NotifyReverse": "Notification on rising/falling",
};

const Map<int, Map<String, String>> Units = {
  254: {
    "RangeStart": "\u00b0C",
    "RangeEnd": "\u00b0C",
  },
  514: {
    "RangeStart": "m",
    "RangeEnd": "m",
    "NotifyLevel": "%",
    "NotifyReverse": "bool",
  }
};

const Map<int, String> ResourceTitles = {
  //254: "TEMPERATURE SETTINGS",
  514: "DISTANCE SETTINGS",
  -1337: "TEST_TITLE"
};

const Map<String, Map<bool, String>> BoolNames = {
  "NotifyReverse": {
    true: "Falling",
    false: "Rising"
  }
};
