#!/bin/bash

# SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# source "scripts\common_gta5_to_cityscapes.sh"


# pseudoweak-cw-pa -> ~ 48.02 mIoU
#
# snapshot_dir="snapshot/"$source"-"$target"-pseudoweak-cw-pa"
# result_dir="result/"$source"-"$target"-pseudoweak-cw-pa"
snapshot_dir="snapshot/GTA-Cityscapes-pseudoweak-cw-pa"
result_dir="result/GTA-Cityscapes-pseudoweak-cw-pa"


#!/bin/bash

# model
model="deeplab_v3"

# dataset
source="gta5"
target="cityscapes"

# if [ "$source" = "gta5" ]
# then
source_path="D:/UOS-SSaS Dropbox/05. Data/00. Benchmarks/06. GTA5"
# fi

# if [ "$target" = "cityscapes" ]
# then
target_path="D:/UOS-SSaS Dropbox/05. Data/00. Benchmarks/01. cityscapes"
# fi

# if [ "$source" = "gta5" ]
# then
source_size="1280,720"
# fi

# if [ "$target" = "cityscapes" ]
# then
target_size="1024,512"
# fi

# if [ "$source" = "gta5" ]
# then
num_classes=19
# fi

source_split="train"
target_split="train"
test_split="val"

# parameters
batch_size=1
num_steps=250000
num_steps_stop=120000

lambda_seg=0.0
lambda_adv1=0.0
lambda_adv2=0.001
lambda_weak2=0.01
lambda_weak_cwadv2=0.001

lr=2.5e-4
lr_d=1e-4

save_step=1000
print_step=100
pweak_th=0.2

#
# training models
#
# - use [--val] to run testing during training for selecting better models (require a validation set in the target domain with ground truths)
# - If `--val-only` is added, the code runs the testing mode.


## training models when GTA is the source domain
# pretrain="models/"$source"_pretrained.pth"

## training models when other dataset is the source domain ##
# pretrain="models/MS_DeepLab_resnet_pretrained_COCO_init.pth"


#
# testing models
#   NB: Do not forget to add the argument `--val-only` below
#
# pretrain=



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
    --restore-from "models/gta5-cityscapes-pseudoweak-cw-pa.pth" \
    --pweak-th $pweak_th \
    --snapshot-dir $snapshot_dir \
    --result-dir $result_dir \
    --save-pred-every $save_step \
    --print-loss-every $print_step \
    --use-weak \
    --use-pseudo \
    --use-weak-cw \
    --use-pixeladapt \
    --val
