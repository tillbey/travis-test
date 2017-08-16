---
title: bla
type: section
draft: false
menu:
  main:
    name: blup
    identifier: blup
    weight: 1
    URL: /docs/blup/
    parent: docs
---

# Tahiti – Interactive image analysis

## Goals
- close the gap between image analysis libraries and ImageJ style point and click programs
- easy chaining together of compatible analysis steps
- provide full support for 3D image stacks, channels, batches
- use existing libraries for analysis and display, allowing to tap into the data at any point with standard Python code

## To do

- [ ] reimplement graphical user interface in [Enaml][2] to avoid double model layer of pyqtgraph and Tahiti
	- [x] use Atom classes for parameters and setting
	- [x] display modules in pipeline panel
	- [ ] integrate with image viewer
- [ ] build an interactive matplotlib module
	- [x] make enaml aware of matplotlib events
	- [ ] plotted points refer back to picture
- [ ] use [pandas][10] with multiindex for storing batch data, including images
	- [ ] open images into a pandas dataframe

## Underlying architecture
The basic unit of Tahiti is the module, which is at the same time a Python module. Modules are contained within pipelines which are modules themselves. This could be extremely useful in order to encapsulate a series of analysis steps. It increases their reusability and leads to a higher abstraction (e.g. “Segment chromocenters” vs. “Gaussian filter”).

### Modules
Each module is defined as a class that specifies inputs and parameters to use in order to generate an output. Each definition in turn resides in a separate file and modules are dynamically loaded at program start. Similar to ImageJ new modules can simply be added to Tahiti by dropping a module file into a specific folder.
![][image-1]
Modules inherit from a base modules that contain all information  on how to handle channels, batches and multiple inputs and outputs. New model definitions are free of this overhead and at the same time modules are compatible with each other.

### Internal image representation
Images are loaded into as [numpy][12] arrays. An array represents a 3-dimensional stack of single channel. Channels are grouped to an image via a Python list, and then hierarchically to batches and an experiment.

### Processing and analysis algorithms
Any Python code can be deployed to manipulate and characterize inputs within a module. So far most functionality comes through the general numpy/[scipy][13] ecosystem and the dedicated image libraries [scikit-image][14] and [mahotas][15]. Due to the reliance of the scientific Python community on numpy arrays integration of other libraries is foreseeable in the future (e.g. [scikit-learn][16] for feature classification or [pandas][17] for downstream data analysis).

## Graphical user interface
Tahiti features a graphical user interface implemented in [Qt5][18] (accessed via [PyQt][19] and complemented by [pyqtgraph][20]). This allows for a fast and intuitive assembly of an image analysis pipeline and inspection of all intermediary steps.

### Image Viewer
Central to Tahiti is an image viewer that displays images in slice, projection or 3D mode. Slices, channels, individual images in a batch (and experimentally each object found in an image) can be easily scrolled through. Additionally images can be explored through a basic LUT tool and histogram.

![][image-2]

### Modules
A graphical representation of modules is automatically generated from the module definition. Inputs can be selected through a drop down list and buttons for each channel. Parameters can be modified through appropriate UI elements. Finally all single output files of a batch may be saved on the hard drive, kept in memory or discarded after each iteration.

![][image-3]

### The pipeline panel
Single modules are added, rearranged or removed to assemble a pipeline. Pipelines can contain pipelines on their own and modules and pipelines can be custom-named to organize and annotate the workflow.

![][image-4]

### Running the pipeline
After running the pipeline selecting a module shows its respective output. If all individual images of a batch were chosen to be saved or retained in memory they are available for inspection in the image viewer.
![][image-5]

## Outlook
- sharing pipelines
- improved integrated plotting of data

[2]:	https://nucleic.github.io/enaml/docs/index.html
[10]:	http://pandas.pydata.org/index.html
[12]:	http://www.numpy.org
[13]:	https://www.scipy.org
[14]:	http://mahotas.readthedocs.io/en/latest/index.html
[15]:	http://mahotas.readthedocs.io/en/latest/index.html
[16]:	http://scikit-learn.org/stable/
[17]:	http://pandas.pydata.org/index.html
[18]:	https://www.qt.io
[19]:	https://www.riverbankcomputing.com/news
[20]:	http://www.pyqtgraph.org

[image-1]:	/docs/images/module-definition.jpg
[image-2]:	/docs/images/image-viewer.jpg
[image-3]:	/docs/images/module-gui.jpg
[image-4]:	/docs/images/pipeline.jpg
[image-5]:	/docs/images/pipeline-viewing.jpg
