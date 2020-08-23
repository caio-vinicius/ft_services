#!/bin/bash

sudo usermod -aG docker $USER
newgrp docker
