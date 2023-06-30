---
tags:
  - Mlops
  - Continuous Integration
---
# Continuous Integration

## Introduction

What is continuous integration? It is the ability to know whether your code
 works.

Continuous Integration (CI) is a development practice where developers integrate
code into a shared repository frequently, preferably several times a day.

## Benefits

CI provides numerous benefits, including early identification of integration
issues, faster software release cycles, and improved code quality.

## Principles

The main principles of CI include:

1.  **Maintain a Single Source Repository:** All code and resources are stored
   in a version-controlled source repository.
2.  **Automate the Build:** Building, testing, and packaging processes are
   automated.
3.  **Make Your Build Self-Testing:** Every commit triggers a build and test
   process.
4.  **Every Commit Should Build the Main Branch:** Developers integrate their
   changes with the main branch regularly.
5.  **Keep the Build Fast:** The build process is designed to be fast to provide
   quick feedback.
6.  **Test in a Clone of the Production Environment:** Use a copy of the
   production environment for testing.
7.  **Make it Easy to Get the Latest Deliverables:** Builds are available for
   testing as soon as they pass.
8.  **Everyone can See What's Happening:** Transparency on the build progress
   and results is crucial.
9.  **Automate Deployment:** Deployment to production or staging environments
   is automated.

## Tools

### Test

* [pytest](../python/pytest.md)

## Other tools

* Organize commands:
      - [Makefile](tools/makefile.md)

Popular CI tools include Jenkins, Travis CI, CircleCI, and
