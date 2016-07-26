python scripts/preprocess.py \
  --input_txt data/largePHP_UTF-8.txt \
  --output_h5 data/largePHP.h5 \
  --output_json data/largePHP.json
  # --input_txt data/tiny-shakespeare.txt \
  # --output_h5 data/tiny-shakespeare.h5 \
  # --output_json data/tiny-shakespeare.json

  th train.lua -input_h5 data/largePHP.h5 -input_json data/largePHP.json -gpu_backend opencl -max_epochs 50 -num_layers 2
  # th train.lua -input_h5 data/tiny-shakespeare.h5 -input_json data/tiny-shakespeare.json -gpu_backend opencl -max_epochs 50 -num_layers 2