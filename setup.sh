#!/usr/bin/env bash

set -e

sudo make install
php-install php 5.3
php-install php 5.4
php-install php 5.5
