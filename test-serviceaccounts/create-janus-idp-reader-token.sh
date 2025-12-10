#!/bin/bash

namespace="default"
serviceaccount="janus-idp-reader"

oc create -n "$namespace" token --duration=168h "$serviceaccount"
