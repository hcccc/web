#!/bin/bash

cd /usr/src/app
bundle install

rails s -b 0.0.0.0
