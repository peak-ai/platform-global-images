APP_NAME="$1"

if [ "${APP_NAME,,}" == "cursor" ]; then
  cursor tunnel
else
  code tunnel
fi
