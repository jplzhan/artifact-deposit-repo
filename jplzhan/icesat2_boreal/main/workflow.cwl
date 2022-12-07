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
        DO_SLOPE_VALID_MASK: boolean
        boreal_vect: string
        expand_training: boolean
        in_atl08: string
        in_atl08_sample: string
        in_landsat: string
        in_tile: string
        in_tile_field: string
        in_tile_num: int
        in_topo: string
        iters: int
        local_train_perc: int
        maxDOY: int
        max_sol_el: int
        minDOY: int
        min_n: int
        ppside: int
      name: parameters
      type: record
  stage_out:
    type:
    - fields:
        aws_access_key_id: string
        aws_secret_access_key: string
        aws_session_token: string
        region: string
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
      DO_SLOPE_VALID_MASK:
        source: parameters
        valueFrom: $(self.DO_SLOPE_VALID_MASK)
      boreal_vect:
        source: parameters
        valueFrom: $(self.boreal_vect)
      expand_training:
        source: parameters
        valueFrom: $(self.expand_training)
      in_atl08:
        source: parameters
        valueFrom: $(self.in_atl08)
      in_atl08_sample:
        source: parameters
        valueFrom: $(self.in_atl08_sample)
      in_landsat:
        source: parameters
        valueFrom: $(self.in_landsat)
      in_tile:
        source: parameters
        valueFrom: $(self.in_tile)
      in_tile_field:
        source: parameters
        valueFrom: $(self.in_tile_field)
      in_tile_num:
        source: parameters
        valueFrom: $(self.in_tile_num)
      in_topo:
        source: parameters
        valueFrom: $(self.in_topo)
      iters:
        source: parameters
        valueFrom: $(self.iters)
      local_train_perc:
        source: parameters
        valueFrom: $(self.local_train_perc)
      maxDOY:
        source: parameters
        valueFrom: $(self.maxDOY)
      max_sol_el:
        source: parameters
        valueFrom: $(self.max_sol_el)
      minDOY:
        source: parameters
        valueFrom: $(self.minDOY)
      min_n:
        source: parameters
        valueFrom: $(self.min_n)
      ppside:
        source: parameters
        valueFrom: $(self.ppside)
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
