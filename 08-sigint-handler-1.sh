source "${TEST_DIR}/funcs.bash"

trap '#^C Killed me!' INT

script=$(cat <<EOM
${TEST_DIR}/scripts/kill-parent.sh
sleep 1
echo It worked
EOM
)

test_start "^C should be ignored by the shell"

output=$(timeout 5 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

compare <(echo "It worked") <(echo "${output}")

test_end
