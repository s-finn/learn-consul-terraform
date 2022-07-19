#!/usr/bin/env bash
set -ex


BASEDIR=$(dirname $0)
cd $BASEDIR

#Deploy infrastructure
if [[ $DESTROY -eq 1  ]]; then
  echo    "========================================"
  echo    "|| Creating API Gateway resources     ||"
  echo    "========================================"
  kubectl apply --filename consul-api-gateway.yaml && \
  kubectl wait  --for=condition=ready gateway/api-gateway --timeout=90s && \
  kubectl apply --filename routes.yaml
  echo    "========================================"
  echo    "|| API Gateway resources created      ||"
  echo    "========================================"

elif [[ $DESTROY -eq 0 ]]; then

  # These are the kustomization resources that need to be patched.
  # Patch the finalizers before trying to delete the resource.
  # Without patching this can deadlock both the resource deletion and underlying CRD deletion.

  echo    "===================================="
  echo    "|| Attempting to remove resources ||"
  echo    "===================================="
  kubectl delete --filename routes.yaml --ignore-not-found=true --grace-period=5 --wait=false
  kubectl delete --filename consul-api-gateway.yaml --ignore-not-found=true --grace-period=5 --wait=false
  echo    "==============================="
  echo    "|| Gateway resources removed ||"
  echo    "==============================="
else
  exit 1
fi

