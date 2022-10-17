#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.icesat2_boreal.main
inputs:
  DO_SLOPE_VALID_MASK:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: DO_SLOPE_VALID_MASK "$(self)"
    type: Any
  boreal_vect_fn:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: boreal_vect_fn "$(self)"
    type: string
  expand_training:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: expand_training "$(self)"
    type: Any
  in_atl08_fn:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_atl08_fn "$(self)"
    type: string
  in_atl08_sample_fn:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_atl08_sample_fn "$(self)"
    type: string
  in_landsat_fn:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_landsat_fn "$(self)"
    type: string
  in_tile_field:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_tile_field "$(self)"
    type: string
  in_tile_fn:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_tile_fn "$(self)"
    type: string
  in_tile_num:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_tile_num "$(self)"
    type: float
  in_topo_fn:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: in_topo_fn "$(self)"
    type: string
  iters:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: iters "$(self)"
    type: float
  local_train_perc:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: local_train_perc "$(self)"
    type: float
  maxDOY:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: maxDOY "$(self)"
    type: float
  max_sol_el:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: max_sol_el "$(self)"
    type: float
  minDOY:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: minDOY "$(self)"
    type: float
  min_n:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: min_n "$(self)"
    type: float
  ppside:
    inputBinding:
      prefix: --parameters
      shellQuote: false
      valueFrom: ppside "$(self)"
    type: float
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
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
