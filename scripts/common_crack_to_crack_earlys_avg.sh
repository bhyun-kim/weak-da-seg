#!/bin/bash

# model
model="deeplab"

# dataset
source="yang_s"
target="crack500_t"
# gaps_s, gaps_t, cfd_s, cfd_t, deepcrack_s, deepcrack_t, cracktree200_s, cracktree200_t
# crack500_s, crack500_t, rissbilder_s, rissbilder_t
# kaggle_s, kaggle_t
# yang_s, yang_t
# cfd_s, cfd_t, ..., rissbilder_s, rissbilder_t

if [ "$source" = "yang_s" ]
then
    source_path="/home/user/WindowsShare/05. Data/02. Training&Test/021. Korean_Express_Corporation/Fine Labeling (2021-2022)/train_val_test"
fi
# /home/user/WindowsShare/05. Data/00. Benchmarks/22. KhanhhaCrack/04. convert2cityscapes
# /home/user/WindowsShare/05. Data/00. Benchmarks/27. crackseg9k/02.convert2cityscapes
# /home/user/WindowsShare/05. Data/00. Benchmarks/23. KaggleCrack/03. Cityscapes Dataset
# /home/user/WindowsShare/05. Data/00. Benchmarks/26. Crack_Yang/02.convert2cityscapes
# /home/user/WindowsShare/05. Data/00. Benchmarks/33. DA/00.train_val_test/001.cfd, 002.gaps, 003.cracktree200, 004.crack500, 005.kaggle, 006.yang, 007.rissbilder

if [ "$target" = "crack500_t" ]
then
    target_path="/home/user/WindowsShare/05. Data/02. Training&Test/021. Korean_Express_Corporation/Fine Labeling (2021-2022)/train_val_test"
fi

# 448,448
# 400,400
# 1008,756
# 306,306

if [ "$source" = "yang_s" ]
then
    source_size="306,306"
fi

if [ "$target" = "crack500_t" ]
then
    target_size="400,400"
fi

if [ "$source" = "yang_s" ]
then
    num_classes=2
fi

train_split="train"
val_split="val"
test_split="test"

# 84, 417, 159, 1205, 257, 647, 2189

# parameters
batch_size=1
num_steps=361500  # num_of_train_data x 300 ~ 500
num_steps_stop=5  # num_of_train_data x 4

lambda_seg=0.0
lambda_adv1=0.0
lambda_adv2=0.0  # 0.001
lambda_weak2=0.01  # 0.01 for pseudo, 0.2 for oracle
lambda_weak_cwadv2=0.001  # 0.001

lr=2.5e-4
# lr=0.00001
lr_d=1e-4

save_step=1205  # num_of_train_data
print_step=1205  # num_of_train_data
pweak_th=0.2

#
# training models
#
# - use [--val] to run testing during training for selecting better models (require a validation set in the target domain with ground truths)
# - If `--val-only` is added, the code runs the testing mode.

## training models when GTA is the source domain
# pretrain="models/"$source"_pretrained.pth"

## training models when other dataset is the source domain ##
pretrain="models/MS_DeepLab_resnet_pretrained_COCO_init.pth"
# pretrain=True

#
# testing models
#   NB: Do not forget to add the argument `--val-only` below
#
# pretrain="model/gta5-cityscapes-pseudoweak-cw.pth"
