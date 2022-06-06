#!/bin/sh -l

SERVER=$1
USER=$2
PASS=$3
IMAGE_TAG=$4

echo "Login to ArgoCD"
argocd login $SERVER --grpc-web --grpc-web-root-path argo --username $USER --password $PASS

APPLICATION_NAME=$(echo $GITHUB_REPOSITORY | awk -F '/' '{print $2}')
echo "Argo Application Name:: $APPLICATION_NAME"
echo "Updating  fabric-chart.podLabels.gitHash with $GITHUB_SHA"
echo "Updating fabric-chart.image.tag :: $IMAGE_TAG"
argocd app set $APPLICATION_NAME -p fabric-chart.podLabels.gitHash=$GITHUB_SHA -p fabric-chart.image.tag=$IMAGE_TAG

