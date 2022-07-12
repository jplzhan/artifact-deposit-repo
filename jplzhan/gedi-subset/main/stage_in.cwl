#!/usr/bin/env cwl-runner
baseCommand:
- sh
- stage_in.sh
class: CommandLineTool
cwlVersion: v1.0
inputs:
  aoi:
    type: string
outputs:
  inputs_yml:
    outputBinding:
      glob: /home/jovyan/inputs/inputs.yml
    type: File
requirements:
  InitialWorkDirRequirement:
    listing:
    - entry: '#!/bin/bash -xe

        mkdir -f /home/jovyan/inputs

        curl $(inputs.aoi) /home/jovyan/inputs/aoi

        echo "aoi: /home/jovyan/inputs/aoi" >> /home/jovyan/inputs/inputs.yml'
      entryname: stage_in.sh
stderr: stage_in_stderr.txt
stdout: stage_in_stdout.txt
