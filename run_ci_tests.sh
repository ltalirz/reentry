set -ev
case "$TEST_TYPE" in 
    unittests)
        tox
        ;;
    pre-commit)
        pre-commit run --all-files || git diff; pip freeze | grep yapf; exit 1
        ;;
    *)
        echo "Invalid value for TEST_TYPE env variable."
        exit 1
esac
