#!/bin/bash
# Deploy script for GitSync
set -e

# Activate venv
if [ -d ".venv" ]; then
    source .venv/bin/activate
else
    echo "Error: .venv not found. Please run build.sh first."
    exit 1
fi

echo ""
echo "==== GitSync Cron Job Setup ===="
echo ""

# Cron help text
echo "Enter the schedule for the cron job (cron format: minute hour day month weekday)"
echo ""
echo "Examples:"
echo "  '0 2 * * *'     -> Run every day at 2 AM"
echo "  '*/15 * * * *'  -> Run every 15 minutes"
echo ""
echo "For more details, see: https://crontab.guru"
echo ""

read -p "Cron schedule: " CRON_SCHEDULE
if [ -z "$CRON_SCHEDULE" ]; then
    echo "Error: Cron schedule is required."
    exit 1
fi

# Get absolute path to main.py and venv
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYTHON_PATH="$PROJECT_DIR/.venv/bin/python"
MAIN_PATH="$PROJECT_DIR/main.py"
LOG_PATH="$PROJECT_DIR/shell_logs.txt"

# Build a single-line crontab entry that runs through /bin/sh -c so we can keep quoting simple.
# Note: we escape $(date) so the date is evaluated when cron runs.
CRON_CMD="$CRON_SCHEDULE /bin/sh -c '/bin/echo \"Cron job triggered at \$(date)\" >> \"$LOG_PATH\"; \"$PYTHON_PATH\" \"$MAIN_PATH\" >> \"$LOG_PATH\" 2>&1'"

# Add only if not present. IMPORTANT: redirect crontab -l stderr to /dev/null so "no crontab" text
# doesn't get injected into the file.
if crontab -l 2>/dev/null | grep -F -xq "$CRON_CMD"; then
  printf "Cron job already exists, not adding.\n"
else
  ( crontab -l 2>/dev/null; echo "$CRON_CMD" ) | crontab -
  printf "Cron job scheduled.\n"
fi

echo ""
echo "Cron job scheduled!"
echo ""
echo "To view all your cron jobs:"
echo "  crontab -l"
echo "To remove all your cron jobs:"
echo "  crontab -r"
echo "To remove just this job, edit with:"
echo "  crontab -e"
echo ""
echo "Logs will be written to $LOG_PATH. Check this file for details and troubleshooting."
