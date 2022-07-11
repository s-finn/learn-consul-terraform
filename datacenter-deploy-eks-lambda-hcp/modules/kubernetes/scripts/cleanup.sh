#!/usr/bin/env bash

ACTION=$1

case "${ACTION}" in

  crds)
    # Remove CRDs objects that are not managed by consul-k8s, otherwise terraform destroy deadlocks
    kubectl get serviceintentions --kubeconfig "${KUBECONFIG}" --context "${KUBE_CONTEXT}" | awk {'print $1'} | grep -v NAME | xargs -I {} kubectl patch serviceintentions {} -p '{"metadata":{"finalizers":[]}}' --type=merge && \
    kubectl get servicesplitters --kubeconfig "${KUBECONFIG}" --context "${KUBE_CONTEXT}" | awk {'print $1'} | grep -v NAME | xargs -I {} kubectl patch servicesplitters {} -p '{"metadata":{"finalizers":[]}}' --type=merge && \
    kubectl get terminatinggateways --kubeconfig "${KUBECONFIG}" --context "${KUBE_CONTEXT}" | awk {'print $1'} | grep -v NAME | xargs -I {} kubectl patch terminatinggateways {} -p '{"metadata":{"finalizers":[]}}' --type=merge && \
    kubectl get serviceresolvers --kubeconfig "${KUBECONFIG}" --context "${KUBE_CONTEXT}" | awk {'print $1'} | grep -v NAME | xargs -I {} kubectl patch serviceresolvers {} -p '{"metadata":{"finalizers":[]}}' --type=merge && \
    kubectl get proxydefaults --kubeconfig "${KUBECONFIG}" --context "${KUBE_CONTEXT}" | awk {'print $1'} | grep -v NAME | xargs -I {} kubectl patch proxydefaults {} -p '{"metadata":{"finalizers":[]}}' --type=merge
  ;;
  hashicups)
    kubectl delete -f