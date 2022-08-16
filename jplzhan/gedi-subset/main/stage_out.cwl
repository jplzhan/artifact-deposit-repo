#!/usr/bin/env cwl-runner
baseCommand:
- echo
- Hello world!
class: CommandLineTool
cwlVersion: v1.1
inputs:
  aws_access_key_id: string
  aws_secret_access_key: string
  output_nb: File
outputs: {}
requirements:
  EnvVarRequirement:
    envDef:
      AWS_ACCESS_KEY_ID: $(inputs.aws_access_key_id)
      AWS_SECRET_ACCESS_KEY: $(inputs.aws_secret_access_key)
  NetworkAccess:
    networkAccess: true
stderr: stage_out_stderr.txt
stdout: stage_out_stdout.txt
