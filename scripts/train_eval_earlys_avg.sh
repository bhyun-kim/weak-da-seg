SCRIPT_DIR="/home/user/weak-da-seg-new/weak-da-seg/scripts"
source $SCRIPT_DIR/common_crack_to_crack_earlys_avg.sh

snapshot_dir="snapshot/"$source"-"$target"-pseudo-earlys_avg"
result_dir="result/"$source"-"$target"-pseudo-earlys_avg"

# train
CUDA_VISIBLE_DEVICES=2 python train_new.py --model $model --dataset-source $source --dataset-target $target --data-path-source "/home/user/WindowsShare/05. Data/00. Benchmarks/33. DA/00.train_val_test/001.cfd" --data-path-target "/home/user/WindowsShare/05. Data/00. Benchmarks/33. DA/00.train_val_test/001.cfd" --input-size-source $source_size --input-size-target $target_size --num-classes $num_classes --train-split $train_split --val-split $val_split --test-split $test_split --batch-size $batch_size --num-steps $num_steps --num-steps-stop $num_steps_stop --lambda-seg $lambda_seg --lambda-adv-target1 $lambda_adv1 --lambda-adv-target2 $lambda_adv2 --lambda-weak-cwadv2 $lambda_weak_cwadv2 --lambda-weak-target2 $lambda_weak2 --learning-rate $lr --learning-rate-D $lr_d --restore-from $pretrain --pweak-th $pweak_th --snapshot-dir $snapshot_dir --result-dir $result_dir --save-pred-every $save_step --print-loss-every $print_step --use-weak --use-pseudo --use-weak-cw --use-pointloss --val

# test
CUDA_VISIBLE_DEVICES=1 python eval_new.py --model deeplab --dataset-source gaps_s --dataset-target crack500_t --data-path-source "/home/user/WindowsShare/05. Data/00. Benchmarks/33. DA/00.train_val_test/001.cfd" --data-path-target "/home/user/WindowsShare/05. Data/00. Benchmarks/33. DA/00.train_val_test/001.cfd" --input-size-source "448,448" --input-size-target "400,400" --num-classes 2 --test-split test --restore-from "/home/user/weak-da-seg-new/weak-da-seg/snapshot/gaps_s-crack500_t-point-split/G-gaps_s-crack500_t.pth" --result-dir "/home/user/weak-da-seg-new/weak-da-seg/result/gaps_s-crack500_t-point-split_12000"