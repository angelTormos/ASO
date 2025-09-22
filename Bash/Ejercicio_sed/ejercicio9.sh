#!/bin/bash

sed -n '5p' '/error/p' /var/log/syslog
