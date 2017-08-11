#------------------------------------------------------------------------------
# Copyright (c) 2017, Till Bey.
#------------------------------------------------------------------------------
import sys
from setuptools import setup, find_packages


setup(
    name='travis-test',
    version='0.1.0',
    author='Till Bey',
    author_email='tillbey@gmail.com',
    url='https://github.com/tillbey/travis-test',
    description='testing',
    packages=find_packages(),
    install_requires=['setuptools', 'matplotlib >= 2.0.0.'],
)
