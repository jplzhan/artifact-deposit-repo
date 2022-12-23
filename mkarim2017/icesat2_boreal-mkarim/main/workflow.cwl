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
        aws_access_key_id: string
        aws_credentials: string
        aws_region: string
        aws_secret_access_key: string
        aws_token: string
        boreal_vect:
          type: &id001
          - fields:
              aws_access_key_id: string
              aws_secret_access_key: string
              aws_session_token: string?
              region_name: string?
              s3_url:
                type:
                - string
                - string[]
            name: S3
            type: record
          - fields:
              password: string
              url:
                type:
                - string
                - string[]
              username: string
            name: DAAC
            type: record
          - fields:
              collection_id: string
              granule_name: string
              maap_pgt: string
            name: MAAP
            type: record
          - fields:
              maap_pgt: string
              url:
                type:
                - string
                - string[]
            name: MAAP_HTTP
            type: record
          - fields:
              role_arn: string
              source_profile: string
            name: Role
            type: record
          - fields:
              path:
                type:
                - File
                - File[]
            name: Local
            type: record
          - fields:
              url:
                type:
                - string
                - string[]
            name: HTTP
            type: record
          - fields:
              s3_url:
                type:
                - string
                - string[]
            name: S3_unsigned
            type: record
        expand_training: boolean
        in_atl08:
          type: *id001
        in_atl08_sample:
          type: *id001
        in_landsat:
          type: *id001
        in_lc:
          type: *id001
        in_tile:
          type: *id001
        in_tile_field: string
        in_tile_num: int
        in_topo:
          type: *id001
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
      DO_SLOPE_VALID_MASK:
        source: parameters
        valueFrom: $(self.DO_SLOPE_VALID_MASK)
      aws_access_key_id:
        source: parameters
        valueFrom: $(self.aws_access_key_id)
      aws_credentials:
        source: parameters
        valueFrom: $(self.aws_credentials)
      aws_region:
        source: parameters
        valueFrom: $(self.aws_region)
      aws_secret_access_key:
        source: parameters
        valueFrom: $(self.aws_secret_access_key)
      aws_token:
        source: parameters
        valueFrom: $(self.aws_token)
      boreal_vect: stage_in_boreal_vect/output_files
      expand_training:
        source: parameters
        valueFrom: $(self.expand_training)
      in_atl08: stage_in_in_atl08/output_files
      in_atl08_sample: stage_in_in_atl08_sample/output_files
      in_landsat: stage_in_in_landsat/output_files
      in_lc: stage_in_in_lc/output_files
      in_tile: stage_in_in_tile/output_files
      in_tile_field:
        source: parameters
        valueFrom: $(self.in_tile_field)
      in_tile_num:
        source: parameters
        valueFrom: $(self.in_tile_num)
      in_topo: stage_in_in_topo/output_files
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
  stage_in_boreal_vect:
    in:
      cache_dir: stage_in_in_tile/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.boreal_vect)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_in_atl08:
    in:
      cache_dir: cache_dir
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_atl08)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_in_atl08_sample:
    in:
      cache_dir: stage_in_in_lc/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_atl08_sample)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_in_landsat:
    in:
      cache_dir: stage_in_in_topo/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_landsat)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_in_lc:
    in:
      cache_dir: stage_in_in_landsat/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_lc)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_in_tile:
    in:
      cache_dir: stage_in_in_atl08_sample/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_tile)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_in_in_topo:
    in:
      cache_dir: stage_in_in_atl08/cache_out
      cache_only: cache_only
      input_path:
        source: parameters
        valueFrom: $(self.in_topo)
    out:
    - cache_out
    - output_files
    run: stage_in.cwl
  stage_out:
    in:
      output_dir: process/output_dir
      output_nb: process/output_nb
      output_path: stage_out
    out: []
    run: stage_out.cwl
