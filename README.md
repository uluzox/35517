# 35517

Reproduction for [Renovate discussion 35517](https://github.com/renovatebot/renovate/discussions/35517).

## Current behavior

[PR](https://github.com/uluzox/35517/pull/1) updates `gitlab` provider in 
`required.tf` and `modules/repo/main.tf` but not in `modules/user/main.tf`.

## Expected behavior

`gitlab` provider is updated in all places

## Logs

> DEBUG: Matched 5 file(s) for manager terraform: modules/repo/main.tf, modules/user/main.tf, repos.tf, required.tf, users.tf

> DEBUG: failed to parse HCL file
> {
> "packageFile": "modules/user/main.tf"
> }

## Reason

https://github.com/tmccombs/hcl2json/issues/110

## Solution

Update dependency @cdktf/hcl2json to v0.20.12

## Link to the Renovate issue or Discussion

[Renovate discussion 35517](https://github.com/renovatebot/renovate/discussions/35517)
