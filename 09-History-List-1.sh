source "${TEST_DIR}/funcs.bash"

test_start "History List"

expected=$(HISTFILE=/dev/null HISTSIZE=100 bash \
    < "${TEST_DIR}/scripts/history-script-1.sh" 2> /dev/null)
actual=$(./$SHELL_NAME < "${TEST_DIR}/scripts/history-script-1.sh" \
    2> /dev/null) || test_end

compare --ignore-all-space <(echo "${expected}") <(echo "${actual}")

test_end
