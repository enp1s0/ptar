#!/bin/bash

ompi_rank=${OMPI_COMM_WORLD_RANK:-0}
ompi_size=${OMPI_COMM_WORLD_SIZE:-0}

file_list_str=$(cat $1)

files_array=($file_list_str)
num_files="${#files_array[@]}"

start_file_id=$(($num_files*$ompi_rank/$ompi_size))
end_file_id=$(($num_files*($ompi_rank+1)/$ompi_size-1))

sub_file_list=$ptar_temp_dir/file_list.$ompi_rank
for i in $(seq $start_file_id $end_file_id);do
	echo "${files_array[$i]}" >> $sub_file_list
done
num_sub_files=$(cat $sub_file_list | wc -l)

printf "[rank:%3d,size:%3d] files [%5d - %5d](num_listed=%10d/%10d)\n" $ompi_rank $ompi_size $start_file_id $end_file_id $num_sub_files $num_files

tar -cf $ptar_temp_dir/ptar-$ompi_rank.tar -T $sub_file_list
