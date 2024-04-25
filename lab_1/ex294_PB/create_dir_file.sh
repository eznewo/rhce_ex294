# ☕ e@ኤር ➤➤ cat lab_setup_helper/creat_dir_file.sh 
# this script creates 12 lesson folders and 12 task files inside each folder
for n in {1..12}; 
do mkdir -p tasks/lesson_$n; 
  for a in {1..9};
  do touch tasks/lesson_$n/task_$n.$a; 
  done
done

