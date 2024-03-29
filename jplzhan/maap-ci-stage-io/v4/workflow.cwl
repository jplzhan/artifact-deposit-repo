#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.1
hints:
  cwltool:Secrets:
    secrets:
    - workflow_aws_access_key_id
    - workflow_aws_secret_access_key
inputs:
  workflow_aws_access_key_id: string
  workflow_aws_secret_access_key: string
outputs: {}
steps:
  process:
    in: {}
    out:
    - output_nb
    run: process.cwl
  stage_out:
    in:
      aws_access_key_id: workflow_aws_access_key_id
      aws_secret_access_key: workflow_aws_secret_access_key
      output_nb: process/output_nb
    out: []
    run: stage_out.cwl
