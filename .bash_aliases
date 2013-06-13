# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias sshoptimus='ssh -Y -t stwirth@130.206.30.12  "screen -R stwirth -D" '
alias sshtomate='ssh -Y -t stwirth@130.206.76.73 "screen -R stwirth -D" '
# alias sshfugu='ssh -t user@192.168.1.170 "screen -R stwirth -D" '
alias sshuibpc='ssh -t user@192.168.43.170 "screen -R stwirth -D" '

alias sshfugu-c='ssh -XY -t user@192.168.1.180 "screen -R stwirth -D" '
#alias sshfugu-c='ssh -XY -t user@fugu-c.local "screen -R stwirth -D" '
alias sshfugu-f='ssh -XY -t user@192.168.1.170 "screen -R user -D" '

alias cu="find . -type f -name '*.h' -print0 | xargs -0 grep"

alias view_down='roslaunch fugu_configurations stereo_view.launch stereo:=/stereo_down/scaled image:=image_color'
alias view_forward='roslaunch fugu_configurations stereo_view.launch stereo:=/stereo_forward image:=image_color'
alias rosmaster_local='export ROS_MASTER_URI=http://localhost:11311'
alias rosmaster_g500='export ROS_MASTER_URI=http://192.168.1.160:11311'
alias rosmaster_fugu-f='export ROS_MASTER_URI=http://192.168.1.170:11311'
alias rosmaster_fugu-c='export ROS_MASTER_URI=http://192.168.1.181:11311'

alias ann='rostopic pub --once /annotations std_msgs/String'

alias rviz='rosrun rviz rviz'

function userobot() { export ROS_MASTER_URI="http://$@:11311" ;}
function sshrobot() { ssh -CY -t swirth@$@ "tmux attach || tmux new" ;}
alias urob='userobot'
alias srob='sshrobot'

