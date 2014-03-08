#pragma once

// Shorthand App Logging
#ifdef RELEASE
  #pragma message "---- RELEASE MODE - NO LOGGING ----"
  #define INFO(...)
  #define LOG(...)
  #define WARN(...)
  #define ERROR(...)
  #undef APP_LOG
  #define APP_LOG(...)
#else
  #define INFO(...) app_log(APP_LOG_LEVEL_INFO, __FILE__, __LINE__, __VA_ARGS__)
  #define LOG(...) app_log(APP_LOG_LEVEL_DEBUG, __FILE__, __LINE__, __VA_ARGS__)
  #define WARN(...) app_log(APP_LOG_LEVEL_WARNING, __FILE__, __LINE__, __VA_ARGS__)
  #define ERROR(...) app_log(APP_LOG_LEVEL_ERROR, __FILE__, __LINE__, __VA_ARGS__)
#endif
