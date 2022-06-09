#!/usr/bin/env cwl-runner
baseCommand:
- sh
- stage_in.sh
class: CommandLineTool
cwlVersion: v1.0
inputs: {}
outputs:
  inputs_yml:
    outputBinding:
      glob: /home/jovyan/inputs/inputs.yml
    type: File
requirements:
  InitialWorkDirRequirement:
    listing:
    - entry: '#!/bin/bash -xe

        mkdir -f /home/jovyan/inputs'
      entryname: stage_in.sh
stderr: stage_in_stderr.txt
stdout: stage_in_stdout.txt
