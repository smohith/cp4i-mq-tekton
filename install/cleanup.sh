#! /bin/bash

#mq00 reserved for instructor
export TARGET_NAMESPACE=cp4i-mq
export QMname=mq00pl
export LABEL="tekton.dev/task=deploy-qm"
export PL_LABEL="tekton.dev/pipeline=mq-pipeline"
export TASK_LABEL="tekton.dev/pipelineTask=deploy-qm"

oc delete queuemanager $QMname -n $TARGET_NAMESPACE
oc delete secret user-at-github -n $TARGET_NAMESPACE
oc delete route el-el-cicd-mq-hook-route -n $TARGET_NAMESPACE
oc delete task deploy-qm -n $TARGET_NAMESPACE
oc delete eventlistener el-cicd-mq -n $TARGET_NAMESPACE
oc delete pipeline mq-pipeline -n $TARGET_NAMESPACE
oc delete pod -l $LABEL -n $TARGET_NAMESPACE
oc delete pipelineRun -l $PL_LABEL -n $TARGET_NAMESPACE
oc delete pipelineTask -l $TASK_LABEL -n $TARGET_NAMESPACE
