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
  DO_SLOPE_VALID_MASK: boolean
  aws_access_key_id: string
  aws_region: string
  aws_secret_access_key: string
  aws_session_token: string
  boreal_vect: File[]
  expand_training: boolean
  in_atl08: File[]
  in_atl08_sample: File[]
  in_landsat: File[]
  in_lc: File[]
  in_tile: File[]
  in_tile_field: string
  in_tile_num: int
  in_topo: File[]
  iters: int
  local_train_perc: int
  maxDOY: int
  max_sol_el: int
  minDOY: int
  min_n: int
  ppside: int
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
    dockerPull: jplzhan/ci-generated-images:mkarim2017.icesat2_boreal-mkarim.main
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
