#!/bin/sh

cd lambda
sh build_env.sh
cd ..

SSLYZE_OPTION=""
PSHTT_OPTION=""

aws lambda get-function --function-name task_sslyze > /dev/null
if [[ $? -ne 0 ]]
then
    SSLYZE_OPTION=" --create"
fi

aws lambda get-function --function-name task_pshtt > /dev/null
if [[ $? -ne 0 ]]
then
    PSHTT_OPTION=" --create"
fi
./lambda/deploy pshtt $PSHTT_OPTION
./lambda/deploy sslyze $SSLYZE_OPTION
