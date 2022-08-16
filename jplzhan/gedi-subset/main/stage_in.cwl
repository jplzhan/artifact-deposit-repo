#!/usr/bin/env cwl-runner
baseCommand:
- python3
- stage_in.py
class: CommandLineTool
cwlVersion: v1.1
hints:
  DockerRequirement:
    dockerPull: jplzhan/ci-generated-images:jplzhan.maap-ci-stage-io.main
inputs:
  aws_access_key_id: string
  aws_secret_access_key: string
  input_path:
    inputBinding:
      position: 2
      shellQuote: false
    type: string
  staging_type:
    inputBinding:
      position: 1
      shellQuote: false
    type: string
outputs:
  output_file:
    outputBinding:
      glob: inputs/*
    type: File
  stdout_txt:
    type: stdout
requirements:
  EnvVarRequirement:
    envDef:
      AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
      AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
  NetworkAccess:
    networkAccess: true
  ShellCommandRequirement: {}
