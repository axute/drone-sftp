#!/bin/bash
echo "generate ~/.lftptc" | ts
tee ~/.lftprc < /.lftprc| ts
echo "done" | ts
