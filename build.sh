# -I = directory where lua.h is found
# -L = directory where liblua.a or libluajit.a is found
# -l = library name
# 
# /Users/tylerlindell/torch/build/exe/luajit-rocks/luajit-2.1/ contains libluajit.dylib
# /Users/tylerlindell/torch/exe/luajit-rocks/lua-5.3/src/ contains C files for lua 
# /Users/tylerlindell/torch/exe/luajit-rocks/luajit-2.1/src/ contains libluajit.a
# luarocks path >> ~/.profile
# --prefix=/Users/tylerlindell/torch/install/lib/
source ~/.profile
g++ main.cpp -o main -Wall -I ~/torch/install/include/ -L ~/lib/ -lluajit -pagezero_size 10000 -image_base 100000000
# g++ main.cpp -o main -Wall -I/Users/tylerlindell/torch/exe/luajit-rocks/lua-5.3/src/ -L/Users/tylerlindell/torch/exe/luajit-rocks/lua-5.3/src/ -llua -lm -ldl
./main