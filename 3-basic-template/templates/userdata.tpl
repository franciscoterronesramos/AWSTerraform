#!/bin/bash
yum install $pkg_srv_web --assume yes
service $pkg_srv_web start