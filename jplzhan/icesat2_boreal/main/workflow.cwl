#!/usr/bin/env cwl-runner
$namespaces:
  cwltool: http://commonwl.org/cwltool#
class: Workflow
cwlVersion: v1.1
inputs:
  DO_SLOPE_VALID_MASK: Any
  boreal_vect_fn: string
  expand_training: Any
  in_atl08_fn: string
  in_atl08_sample_fn: string
  in_landsat_fn: string
  in_tile_field: string
  in_tile_fn: string
  in_tile_num: float
  in_topo_fn: string
  iters: float
  local_train_perc: float
  maxDOY: float
  max_sol_el: float
  minDOY: float
  min_n: float
  ppside: float
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
steps:
  process:
    in:
      DO_SLOPE_VALID_MASK: DO_SLOPE_VALID_MASK
      boreal_vect_fn: boreal_vect_fn
      expand_training: expand_training
      in_atl08_fn: in_atl08_fn
      in_atl08_sample_fn: in_atl08_sample_fn
      in_landsat_fn: in_landsat_fn
      in_tile_field: in_tile_field
      in_tile_fn: in_tile_fn
      in_tile_num: in_tile_num
      in_topo_fn: in_topo_fn
      iters: iters
      local_train_perc: local_train_perc
      maxDOY: maxDOY
      max_sol_el: max_sol_el
      minDOY: minDOY
      min_n: min_n
      ppside: ppside
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
