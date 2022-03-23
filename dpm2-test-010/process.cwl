#!/usr/bin/env cwl-runner
baseCommand:
- papermill
- /home/jovyan/process.ipynb
- output_nb.ipynb
class: CommandLineTool
cwlVersion: v1.0
hints:
  DockerRequirement:
    dockerPull: docker://jplzhan/ci-generated-images:dpm2-test-010
inputs:
  _disk_usage:
    inputBinding:
      position: 12
      prefix: --parameters
      shellQuote: false
      valueFrom: _disk_usage "$(self)"
    type: string
  _label:
    inputBinding:
      position: 15
      prefix: --parameters
      shellQuote: false
      valueFrom: _label "$(self)"
    type: string
  _required_queue:
    inputBinding:
      position: 14
      prefix: --parameters
      shellQuote: false
      valueFrom: _required_queue "$(self)"
    type: string
  _soft_time_limit:
    inputBinding:
      position: 11
      prefix: --parameters
      shellQuote: false
      valueFrom: _soft_time_limit "$(self)"
    type: float
  _submission_type:
    inputBinding:
      position: 13
      prefix: --parameters
      shellQuote: false
      valueFrom: _submission_type "$(self)"
    type: string
  _time_limit:
    inputBinding:
      position: 10
      prefix: --parameters
      shellQuote: false
      valueFrom: _time_limit "$(self)"
    type: float
  bbox:
    inputBinding:
      position: 5
      prefix: --parameters
      shellQuote: false
      valueFrom: bbox "$(self)"
    type: string
  end_date:
    inputBinding:
      position: 8
      prefix: --parameters
      shellQuote: false
      valueFrom: end_date "$(self)"
    type: string
  master_date:
    inputBinding:
      position: 6
      prefix: --parameters
      shellQuote: false
      valueFrom: master_date "$(self)"
    type: string
  max_lat:
    inputBinding:
      position: 2
      prefix: --parameters
      shellQuote: false
      valueFrom: max_lat "$(self)"
    type: float
  max_lon:
    inputBinding:
      position: 4
      prefix: --parameters
      shellQuote: false
      valueFrom: max_lon "$(self)"
    type: float
  min_lat:
    inputBinding:
      position: 1
      prefix: --parameters
      shellQuote: false
      valueFrom: min_lat "$(self)"
    type: float
  min_lon:
    inputBinding:
      position: 3
      prefix: --parameters
      shellQuote: false
      valueFrom: min_lon "$(self)"
    type: float
  start_date:
    inputBinding:
      position: 7
      prefix: --parameters
      shellQuote: false
      valueFrom: start_date "$(self)"
    type: string
  track_number:
    inputBinding:
      position: 9
      prefix: --parameters
      shellQuote: false
      valueFrom: track_number "$(self)"
    type: float
outputs: {}
requirements:
  ShellCommandRequirement: {}
stdout: _stdout.txt
