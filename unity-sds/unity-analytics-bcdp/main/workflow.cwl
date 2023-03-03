#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.2
inputs:
  cache_dir: Directory?
  cache_only:
    default: false
    type: boolean
  parameters:
    type:
      fields:
        activity_id: string
        backend: string
        experiment_id: string
        freq: string
        grid_label: string
        institution_id: string
        lat_bnds: Any
        lon_bnds: Any
        member_id: string
        method: string
        res: Any
        season: Any
        table_id: string
        time_bnds: Any
        variable_id: string
      name: parameters
      type: record
  stage_out:
    type:
    - fields:
        aws_access_key_id: string
        aws_secret_access_key: string
        aws_session_token: string
        region_name: string
        s3_url: string
      name: STAK
      type: record
    - fields:
        aws_config: Directory
        s3_url: string
      name: LTAK
      type: record
    - fields:
        s3_url: string
      name: IAM
      type: record
outputs: {}
requirements:
  StepInputExpressionRequirement: {}
steps:
  process:
    in:
      activity_id:
        source: parameters
        valueFrom: $(self.activity_id)
      backend:
        source: parameters
        valueFrom: $(self.backend)
      experiment_id:
        source: parameters
        valueFrom: $(self.experiment_id)
      freq:
        source: parameters
        valueFrom: $(self.freq)
      grid_label:
        source: parameters
        valueFrom: $(self.grid_label)
      institution_id:
        source: parameters
        valueFrom: $(self.institution_id)
      lat_bnds:
        source: parameters
        valueFrom: $(self.lat_bnds)
      lon_bnds:
        source: parameters
        valueFrom: $(self.lon_bnds)
      member_id:
        source: parameters
        valueFrom: $(self.member_id)
      method:
        source: parameters
        valueFrom: $(self.method)
      res:
        source: parameters
        valueFrom: $(self.res)
      season:
        source: parameters
        valueFrom: $(self.season)
      table_id:
        source: parameters
        valueFrom: $(self.table_id)
      time_bnds:
        source: parameters
        valueFrom: $(self.time_bnds)
      variable_id:
        source: parameters
        valueFrom: $(self.variable_id)
    out:
    - output_nb
    - output_dir
    - nc_file
    - plot_file
    run: process.cwl
  stage_out:
    in:
      nc_file: process/nc_file
      output_dir: process/output_dir
      output_nb: process/output_nb
      output_path: stage_out
      plot_file: process/plot_file
    out: []
    run: stage_out.cwl
