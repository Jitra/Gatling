#!/bin/bash
simulation=${1:-computerdatabase.BasicSimulation}

gatling.sh -sf /opt/gatling/user-files/simulations/ -s $simulation -rf $GATLING_RESULTS
newest=`ls $GATLING_RESULTS | sort -n -t _ -k 2 | tail -1`
rm -rf $GATLING_RESULTS_NEWEST/site
cp -R $GATLING_RESULTS/$newest $GATLING_RESULTS_NEWEST/site