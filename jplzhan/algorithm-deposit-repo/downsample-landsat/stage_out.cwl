#!/usr/bin/env cwl-runner
baseCommand:
- sh
- stage_out.sh
class: CommandLineTool
cwlVersion: v1.0
inputs:
  image:
    type: File
  output_nb:
    type: File
  wildcard:
    type: File
outputs: null
requirements:
  InitialWorkDirRequirement:
    listing:
    - entry: '#!/bin/bash -xe

        echo "Hello world!"'
      entryname: stage_out.sh
stderr: stage_out_stderr.txt
stdout: stage_out_stdout.txt
