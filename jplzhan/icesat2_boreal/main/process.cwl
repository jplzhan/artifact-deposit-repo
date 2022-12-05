#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
- -f
- /tmp/inputs.json
class: CommandLineTool
cwlVersion: v1.2
inputs:
  DO_SLOPE_VALID_MASK: Any
  boreal_vect_fn: string
  expand_training: Any
  in_atl08_fn: string
  in_atl08_sample_fn: string
  in_landsat_fn: string
  in_tile_field: string
  in_tile_fn: string
  in_tile_num: float
  in_topo_fn: string
  iters: float
  local_train_perc: float
  maxDOY: float
  max_sol_el: float
  minDOY: float
  min_n: float
  ppside: float
outputs:
  output_dir:
    outputBinding:
      glob: output
    type: Directory
  output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
requirements:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.icesat2_boreal.main
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
