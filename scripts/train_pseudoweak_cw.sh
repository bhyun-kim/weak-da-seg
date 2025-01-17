#!/bin/bash

# SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# source $SCRIPT_DIR/common_gta5_to_cityscapes.sh

source scripts/common_gta5_to_cityscapes.sh
# pseudoweak-cw -> ~ 45.5 mIoU
#
snapshot_dir="snapshot/"$source"-"$target"-pseudoweak-cw"
result_dir="result/"$source"-"$target"-pseudoweak-cw"
python train.py \
    --model $model \
    --dataset-source $source \
    --dataset-target $target \
    --data-path-source "D:/UOS-SSaS Dropbox/05. Data/00. Benchmarks/06. GTA5" \
    --data-path-target "D:/UOS-SSaS Dropbox/05. Data/00. Benchmarks/01. cityscapes" \
    --input-size-source $source_size \
    --input-size-target $target_size \
    --num-classes $num_classes \
    --source-split $source_split \
    --target-split $target_split \
    --test-split $test_split \
    --batch-size $batch_size \
    --num-steps $num_steps \
    --num-steps-stop $num_steps_stop \
    --lambda-seg $lambda_seg \
    --lambda-adv-target1 $lambda_adv1 \
    --lambda-adv-target2 $lambda_adv2 \
    --lambda-weak-cwadv2 $lambda_weak_cwadv2 \
    --lambda-weak-target2 $lambda_weak2 \
    --learning-rate $lr \
    --learning-rate-D $lr_d \
    --restore-from "models/gta5-cityscapes-pseudoweak-cw-pa.pth"  \
    --pweak-th $pweak_th \
    --snapshot-dir $snapshot_dir \
    --result-dir $result_dir \
    --save-pred-every $save_step \
    --print-loss-every $print_step \
    --use-weak \
    --use-pseudo \
    --use-weak-cw \
    --val
