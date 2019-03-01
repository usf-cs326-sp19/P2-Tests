source "${TEST_DIR}/funcs.bash"

script=$(cat <<EOM
seq 10000000 | wc -l
EOM
)

test_start ""

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

expected=$(sh <(echo "${script}") 2> /dev/null)
actual=$(timeout 15 ./$SHELL_NAME < <(echo "${script}") 2> /dev/null) \
    || test_end
compare <(echo "${expected}") <(echo "${actual}")

test_end
