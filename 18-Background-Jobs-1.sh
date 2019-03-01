source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
sleep 500 &
sleep 100 &
sleep 85 &
sleep 450 &
echo Done
${TEST_DIR}/scripts/kill-parent.sh
EOM
)

test_start "History Execution !!"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

actual=$(timeout 1 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null)

compare <(echo "Done") <(echo "${actual}")

test_end
