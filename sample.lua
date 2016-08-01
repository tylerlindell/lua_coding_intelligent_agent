require 'torch'
require 'nn'

require 'LanguageModel'

-- local cmd = torch.CmdLine()
-- cmd:option('-checkpoint', '')
-- cmd:option('-length', 2000)
-- cmd:option('-start_text', '')
-- cmd:option('-sample', 1)
-- cmd:option('-temperature', 1)
-- cmd:option('-gpu', 0)
-- cmd:option('-gpu_backend', 'cuda')
-- cmd:option('-verbose', 0)
-- local opt = cmd:parse(arg)


function add( checkpointNumber, character )
  local opt = {}
  opt.checkpoint = 'cv/lua/checkpoint_147000.t7'
  opt.checkpoint = string.format('cv/lua/checkpoint_%s.t7', checkpointNumber)
  opt.start_text = character
  opt.gpu_backend = 'opencl'
  opt.length = '20'
  opt.sample = 1
  opt.temperature = 1
  opt.gpu = 0
  opt.gpu = 0
  opt.verbose = 0


  local checkpoint = torch.load(opt.checkpoint)
  local model = checkpoint.model
  -- print(model);

  local msg
  if opt.gpu >= 0 and opt.gpu_backend == 'cuda' then
    require 'cutorch'
    require 'cunn'
    cutorch.setDevice(opt.gpu + 1)
    model:cuda()
    msg = string.format('Running with CUDA on GPU %d', opt.gpu)
  elseif opt.gpu >= 0 and opt.gpu_backend == 'opencl' then
    require 'cltorch'
    require 'clnn'
    model:cl()
    msg = string.format('Running with OpenCL on GPU %d', opt.gpu)
  else
    msg = 'Running in CPU mode'
  end
  if opt.verbose == 1 then print(msg) end

  model:evaluate()

  local sample = model:sample(opt)
  print('\n')
  print(sample)
  print('\n____________________________________________________\n\n')

end