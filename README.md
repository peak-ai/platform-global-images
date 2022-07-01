<img src=".github/images/peak.gif" width="100" height="100" />

# Peak global images
![](https://img.shields.io/github/license/peak-ai/platform-global-images)
![](https://img.shields.io/github/languages/count/peak-ai/platform-global-images)
![](https://img.shields.io/github/languages/top/peak-ai/platform-global-images)
![](https://img.shields.io/github/issues-raw/peak-ai/platform-global-images)
![](https://img.shields.io/github/issues-pr-raw/peak-ai/platform-global-images)
![](https://img.shields.io/github/languages/code-size/peak-ai/platform-global-images)
![](https://img.shields.io/github/repo-size/peak-ai/platform-global-images)

This repository contains the source code for the global images that are available on Peak.<p>
For more information about using Docker images with Peak, see [Image Management](https://platformsupport.peak.ai/support/solutions/folders/80000683574) in the Peak knowledge base.

## Getting started
### Directory structure
The images contained in this repository are organised in the following way:
```
├── peak-ai
│   └── platform-global-images
│       └── Platform Function         The area of the platform where the image can be used, for example Workflows.
│           └── Language              The programming language used for the image, for example Python or R.
│               └── Image-Package     This could be an image that is suitable for standard use or advanced, data science use.
│                   └── Version       The version number of the image. 

```

### Folder contents
Each folder contains the following:
- **The Dockerfile for the image**
This contains a script that provides instructions for how the image should be built.
- **The image dependencies**
These are the build arguments that are required for the image.
- **A readme file**
Guidelines for using the image

## What images are available to use?
All of the images in this repository are designed to help you get the best out of Peak.
### [Workflows](./workflow)
These images enable Peak users to run Workflows.<p>
For more information on configuring Peak Workflows, see [Workflows](https://platformsupport.peak.ai/support/solutions/folders/80000683354) in the Peak knowledge base.

#### [Python](./workflow/python)
The following Python images are available:
- [standard-pack](./workflow/python/standard-pack)
- [ds-pack](./workflow/python/ds-pack)
#### [R](./workflow/r)
The following R images are available:
- [standard-pack](./workflow/r/standard-pack)
- [ds-pack](./workflow/r/ds-pack)

### [Workspace](./workspace)
These images enable Peak users to run Workspaces.<p>
For more information on configuring Peak Workspaces, see [Workspaces](https://platformsupport.peak.ai/support/solutions/folders/80000682771) in the Peak knowledge base.

#### [Python](./workspace/python)
The following Python image is available:
- [ds-pack](./workspace/python/ds-pack)
#### [R](./workspace/r)
The following R image is available:
- [ds-pack](./workspace/r/ds-pack)

## Contributing
We really appreciate any contributions that you can make to the images. <P>To get started, please read our [contributing guide](./CONTRIBUTING.md) to familiarize yourself with our development process.

## License
[GNU GPL](https://opensource.org/licenses/GPL-3.0)
