#!/bin/env python
import os
import json

env = Environment()

#-------------------------------------------------------------------------------
# tools
#-------------------------------------------------------------------------------
def shell_execute(cmd):
    print cmd
    ret = os.system(cmd)
    return ret 

#-------------------------------------------------------------------------------
# scons -h 
#-------------------------------------------------------------------------------
Help("""
    scons [target] [options]
           options
                   --execute -- Execute command             

           upgrade           -- Upgrade yum repo server
           compiler          -- Execute an environment of compiler docker
           package           -- Package all program
""")


#-------------------------------------------------------------------------------
# scons build 
#-------------------------------------------------------------------------------
AddOption("--release", action="store_true", dest="release", default=False, help="Build release version")
release = GetOption("release")
def build(target, source, env):
    if release == True:
        cmd = "make bootstrap && make build-release"
    else:
        cmd = "make bootstrap && make build"
    ret = shell_execute(cmd)
    return ret

build = env.Alias('build', os.getcwd(), build)
env.AlwaysBuild(build)

#-------------------------------------------------------------------------------
# scons compiler
#-------------------------------------------------------------------------------
AddOption("--execute", action="store", type="string", dest="execute", nargs=1, default="", help="Execute command in compiler")
command = GetOption("execute")
def compiler(target, source, env):
    opts = ""
    if command == '/bin/bash':
        opts = "-ti"
    cmd = "docker run %s --rm --privileged=true \
            --net=host \
            -v ~/.ccache:/root/.ccache \
            -v ~/.vimrc:/root/.vimrc \
            -v ~/.ssu:/root/.ssu \
            -v $PWD:/buildroot \
            miner-compiler \
            /bin/bash -c 'cd buildroot && %s'" % (opts, command)
    ret = shell_execute(cmd)
    return ret

compiler = env.Alias('compiler', os.getcwd(), compiler)
env.AlwaysBuild(compiler)
#-------------------------------------------------------------------------------
