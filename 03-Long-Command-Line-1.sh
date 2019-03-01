source "${TEST_DIR}/funcs.bash"

test_start "Testing long command lines"

timeout 5 ./$SHELL_NAME < "${TEST_DIR}/scripts/too-long.sh" &> /dev/null || test_end 1
expected=$(sh < "${TEST_DIR}/scripts/long.sh" 2> /dev/null)
actual=$(timeout 5 ./$SHELL_NAME < "${TEST_DIR}/scripts/long.sh" 2> /dev/null) || test_end 1

compare <(echo "${expected}") <(echo "${actual}")

test_end
