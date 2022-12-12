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
  aoi: File[]
  columns: string
  limit: int
  maappgt: string
  query: string
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
    dockerPull: jplzhan/ci-generated-images:jplzhan.gedi-subset.main
  InitialWorkDirRequirement:
    listing:
    - entry: $(inputs)
      entryname: /tmp/inputs.json
    - entry: $(inputs.aoi)
      entryname: $(inputs.aoi.path)
      writable: true
  InplaceUpdateRequirement:
    inplaceUpdate: true
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
stdout: _stdout.txt
