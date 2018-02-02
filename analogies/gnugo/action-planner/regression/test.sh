#!/bin/sh

ACTION_PLANNER=../interface/action-planner

gtpfile=$1
options=$2   # May be omitted
options2=$3  # May be omitted  FIXME: Do multiple options nicer.

$ACTION_PLANNER --quiet $options $options2 --mode gtp <$gtpfile | egrep '^[=?][0-9]+' | cut -c 2-
