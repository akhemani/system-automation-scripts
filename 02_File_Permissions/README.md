# File Permission Checker

This script is designed to automate the task of verifying file and directory permissions. It ensures that files are secure, meet the specified permission standards, and are owned by the correct user.

### Features:
- Verifies file permissions against expected values (e.g., `644`, `755`).
- Flags world-writable files and alerts about potential security risks.
- Ensures that files are owned by the correct user to maintain system integrity.

### Usage:
1. Clone the repository.
2. Navigate to the `file-permission-checker/` folder.
3. Run the script with the following command:
   ```bash
   ./file_permission_checker.sh <file/directory> <expected_permissions>
