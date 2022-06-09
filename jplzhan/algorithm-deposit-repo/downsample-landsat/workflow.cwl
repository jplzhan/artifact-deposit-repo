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
  input_file:
    type: string
  max_spin_time:
    type: int
outputs:
  final_dataset_dir:
    outputSource: process/dataset_dir
    type: Directory
  stderr-process:
    outputSource: process/stderr_file
    type: File
  stderr-stage_out:
    outputSource: stage_out/stderr_file
    type: File
  stdout-process:
    outputSource: process/stdout_file
    type: File
  stdout-stage_out:
    outputSource: stage_out/stdout_file
    type: File
steps:
  process:
    in:
      input_file: stage_in/image_file
      max_spin_time: workflow_max_spin_time
      min_spin_time: workflow_min_spin_time
    out:
    - output_nb_file
    - dataset_dir
    - stdout_file
    - stderr_file
    run: process.cwl
  stage_in:
    in:
      input_url: workflow_input_url
    out:
    - output_nb_file
    - image_file
    - stdout_file
    - stderr_file
    run: stage_in.cwl
  stage_out:
    in:
      aws_access_key_id: workflow_aws_access_key_id
      aws_secret_access_key: workflow_aws_secret_access_key
      base_dataset_url: workflow_base_dataset_url
      dataset_dir: process/dataset_dir
    out:
    - stdout_file
    - stderr_file
    run: stage_out.cwl
