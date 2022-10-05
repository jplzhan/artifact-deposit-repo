#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.1
inputs:
  stage_out:
  - fields:
      aws_access_key_id: string
      aws_secret_access_key: string
      aws_session_token: string
      region: string
      s3_url: string
    name: stage_out
    type: record
outputs: {}
steps:
  process:
    in: {}
    out:
    - output_nb
    - output_dir
    run: process.cwl
  stage_out:
    in:
      output_dir: process/output_dir
      output_nb: process/output_nb
      output_path: stage_out
    out: []
    run: stage_out.cwl
