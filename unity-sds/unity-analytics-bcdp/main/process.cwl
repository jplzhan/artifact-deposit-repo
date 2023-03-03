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
  activity_id: string
  backend: string
  experiment_id: string
  freq: string
  grid_label: string
  institution_id: string
  lat_bnds: Any
  lon_bnds: Any
  member_id: string
  method: string
  res: Any
  season: Any
  table_id: string
  time_bnds: Any
  variable_id: string
outputs:
  nc_file:
    outputBinding:
      glob: '''CMIP_example.nc'''
    type: File
  output_dir:
    outputBinding:
      glob: output
    type: Directory
  output_nb:
    outputBinding:
      glob: output_nb.ipynb
    type: File
  plot_file:
    outputBinding:
      glob: '''CMIP_example.png'''
    type: File
requirements:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:unity-sds.unity-analytics-bcdp.main
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
