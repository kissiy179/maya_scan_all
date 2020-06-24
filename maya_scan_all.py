import os
import sys
import functools
import maya.standalone
maya.standalone.initialize()
import maya.cmds as cmds
import maya.utils as utils

root_dir = sys.argv[1] if len(sys.argv) > 1 else ''
extensions = ['.ma', '.mb']
scan_count = 10

def main(root_dir=''):
    cmds.loadPlugin('MayaScanner')
    scn_files = []
    for dir_, dirs, files in os.walk(root_dir):
        for file_ in files:
            name, ext = os.path.splitext(file_)

            if not ext in extensions:
                continue
            
            scn_files.append(os.path.join(dir_, file_))

    for i, scn_file in enumerate(scn_files):
        if i >= scan_count: 
            break

        cmds.file(scn_file, open=True)
        cmds.MayaScan()
        
main(root_dir)