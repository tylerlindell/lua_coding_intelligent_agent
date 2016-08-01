#Lua Coding Intelligent Agent
This is a pretrained agent for writing code in Lua. The vision is to improve the speed and accuracy for developers creating and testing Lua code. For people building games or AI with [Torch](http://torch.ch/) utilizing [Lua](https://www.lua.org/) will be able to more abstractly write their code with the help of an intelligent agent. There is still lots of work to be done.

#Installation and Usage
This was taken directly from torch-rnn and trained. For instructions on installation and useage please see [their documentation](https://github.com/jcjohnson/torch-rnn).

#Up and Running right now
After installation by following the instruction on the [torch-rnn](https://github.com/jcjohnson/torch-rnn) readme, you will be able to run the sample from the most up-to-date trained model by following the instructions below.

**with NVIDIA video card**

- ```cd lua_coding_intelligent_agent```
- ```th sample.lua -checkpoint cv/lua/checkpoint_280400.t7 -length 200 -temperature 1 -start_text "func"```

**with other video card**

- ```cd lua_coding_intelligent_agent```
- ```bash build.sh```

#TODO
- More training of this agent can/should be done and submitted directly to this repository for others to improve upon.
- Create the ability to integrate with IDEs. The ability to output code is currently rudimentary (e.g. just outputs arbitrary code into console).
- Build in some contextual indication for knowing when a certain piece of code should be used.