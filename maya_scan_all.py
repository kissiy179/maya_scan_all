import os
import sys
import functools
import maya.standalone
maya.standalone.initialize()
import maya.cmds as cmds
from MayaScannerCleaner import clean_malware, MayaScannerLogFile, rollOverLogFile, reportIssue

root_dir = os.getcwd()
extensions = ['.ma', '.mb']
scan_count = -1

def main(root_dir):
    cmds.loadPlugin('MayaScanner')
    rollOverLogFile()
    scn_files = []

    for dir_, dirs, files in os.walk(root_dir):
        for file_ in files:
            name, ext = os.path.splitext(file_)

            if not ext in extensions:
                continue
            
            scn_files.append(os.path.join(dir_, file_))

    for i, scn_file in enumerate(scn_files):
        if scan_count >=0 and i >= scan_count: 
            break

        reportIssue('', smode=1)
        cmds.file(scn_file, open=True)
        clean_malware('current scene')
        
main(root_dir)