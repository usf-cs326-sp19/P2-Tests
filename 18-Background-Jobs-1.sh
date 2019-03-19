source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
${TEST_DIR}/scripts/sleeper 500 &
${TEST_DIR}/scripts/sleeper 100 &
${TEST_DIR}/scripts/sleeper 85 &
${TEST_DIR}/scripts/sleeper 450 &
echo Done
${TEST_DIR}/scripts/kill-parent.sh
EOM
)

test_start "Background job support"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

actual=$(timeout 1 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) || test_end 1

compare <(echo "Done") <(echo "${actual}")

test_end
