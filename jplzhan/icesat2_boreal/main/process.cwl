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
  boreal_vect: File[]
  expand_training: boolean
  in_atl08: File[]
  in_atl08_sample: File[]
  in_landsat: File[]
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
    dockerPull: jplzhan/ci-generated-images:jplzhan.icesat2_boreal.main
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
    - entry: $(inputs.in_atl08)
      entryname: $(inputs.in_atl08.path)
      writable: true
    - entry: $(inputs.in_topo)
      entryname: $(inputs.in_topo.path)
      writable: true
    - entry: $(inputs.in_landsat)
      entryname: $(inputs.in_landsat.path)
      writable: true
    - entry: $(inputs.in_atl08_sample)
      entryname: $(inputs.in_atl08_sample.path)
      writable: true
    - entry: $(inputs.in_tile)
      entryname: $(inputs.in_tile.path)
      writable: true
    - entry: $(inputs.boreal_vect)
      entryname: $(inputs.boreal_vect.path)
      writable: true
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
