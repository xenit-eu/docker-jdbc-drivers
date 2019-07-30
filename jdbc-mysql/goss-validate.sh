#!/bin/sh
echo "Running '$0'"

/goss/goss --gossfile /goss.yaml validate --no-color --format junit > /goss-results/TEST-goss.xml
#/goss/goss --gossfile /goss.yaml validate --color --format documentation

GOSS_EXIT_CODE=$?

cat /goss-results/TEST-goss.xml

echo "Goss validation exiting with code ${GOSS_EXIT_CODE}"
exit $GOSS_EXIT_CODE