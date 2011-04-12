#!/usr/bin/env python

import os
import sys

#-----------------------------------------------------------------------------
# File attributes:
# - parent:     the folder which is the parent of this file
# - name:       file name
#-----------------------------------------------------------------------------
class BaseFile:

    def __init__(self, parent, name):
        self.parent   = parent
        self.name     = name

#-----------------------------------------------------------------------------
# File attributes:
# - extensions: list of the extensions of versions of the file
# - updated:    last updated version of the document
#-----------------------------------------------------------------------------
class File(BaseFile):

    def __init__(self, parent, name):
        BaseFile.__init__(self, parent, name)

        self.extensions = []
        self.updated    = None
        
    
#-----------------------------------------------------------------------------
# Folder attributes:
# - files:      list of files in this folder
# - folders:    list of folders in this folder
#-----------------------------------------------------------------------------
class Folder(BaseFile):

    def __init__(self, parent, name):
        BaseFile.__init__(self, parent, name)
        
        self.files   = []
        self.folders = []

    
oFile = "documents.rhtml"

doc_dirs = [
    "band-boosters",
    "competitions",
    "forms",
    "fund-raising",
    "old"
]

class