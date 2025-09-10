# Real-Time Log Monitor

This script continuously monitors server logs for HTTP 500 errors and sends real-time alerts whenever a 500 error is detected. It’s designed to help system administrators quickly respond to server-side issues, reducing downtime and improving system reliability.

### Features:
- Monitors log files for HTTP 500 errors in real-time.
- Sends immediate alerts when a 500 error is detected.
- Helps reduce downtime by allowing immediate response to critical server-side failures.

### Usage:
1. Clone the repository.
2. Navigate to the `real-time-log-monitor/` folder.
3. Run the script with the following command:
   ```bash
   ./log_monitor.sh <log_file_path>
