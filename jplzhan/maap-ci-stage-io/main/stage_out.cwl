#!/usr/bin/env cwl-runner
baseCommand:
- sh
- stage_out.sh
class: CommandLineTool
cwlVersion: v1.1
inputs:
  aws_access_key_id: string
  aws_secret_access_key: string
  output_nb: File
outputs: null
requirements:
  EnvVarRequirement:
    envDef:
      AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
      AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
  InitialWorkDirRequirement:
    listing:
    - entry: '#!/bin/bash -xe

        echo "Hello world!"'
      entryname: stage_out.sh
  NetworkAccess:
    networkAccess: true
stderr: stage_out_stderr.txt
stdout: stage_out_stdout.txt
