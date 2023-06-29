---
tags:
  - Mlops
  - Introduction
---

# Intro to MLops

MLOps, or Machine Learning Operations, is a discipline that merges the # MLOps:
 Unifying Machine Learning System Development and Operation

MLOps, or Machine Learning Operations, is a discipline that merges the
 development (Dev) and operation (Ops) of machine learning (ML) systems. As
  data science and ML continue to become key capabilities for solving complex
   real-world problems, the practice of MLOps is gaining traction. MLOps aims
    to promote automation and monitoring throughout the construction of ML
     systems, including integration, testing, release, deployment, and
      infrastructure management.

## MLOps is More than Just ML Code

The complexity of real-world ML systems goes beyond the ML code. The required
 elements surrounding the ML code comprise a vast and intricate system that
  includes configuration, automation, data collection, data verification,
   testing and debugging, resource management, model analysis, process and
    metadata management, serving infrastructure, and monitoring. In other words,
    only a small fraction of an ML system is composed of the ML code
     itself.

## MLOps: A Marriage of DevOps and Machine Learning

Just as DevOps principles have proved beneficial in the development and
 operation of large-scale software systems, these principles are applicable to
  ML systems as well. However, ML systems have distinct characteristics:

1.  **Team skills**: An ML project typically involves data scientists or ML
    researchers who might not be experienced software engineers capable of
     building production-class services.
2.  **Development**: ML is experimental in nature. Challenges arise in tracking
    what worked and what didn't, and maintaining reproducibility while
     maximizing code reusability.
3.  **Testing**: Testing an ML system is more complex than testing other
   software systems. It requires data validation, trained model quality
    evaluation, and model validation.
4.  **Deployment**: Deployment in ML systems often entails deploying a
    multi-step pipeline to automatically retrain and deploy models.
5.  **Production**: ML models can experience performance degradation due to
    constantly evolving data profiles, necessitating the tracking of summary
     statistics of data and monitoring of the online performance of models.

## Developing ML Models: Steps to Success

Although the precise steps may vary depending on the specific ML project, a
 general process can be outlined for developing ML models:

1.  **Understanding the problem**: This involves defining the business problem,
    identifying the ML task, and preparing the initial data.
2.  **Data preparation**: This step includes gathering, cleaning, and
    transforming data for the ML model.
3.  **Model building**: This includes selecting the model, training it, and then
    evaluating its performance.
4.  **Model deployment**: This involves deploying the model into a production environment.
5.  **Monitoring and maintenance**: This step involves monitoring the
    performance of the model over time, retraining it as necessary, and
     performing model updates.

##  MLops Hierarchy of needs

![Mlops Hierarchy of Needs](lops-hierarchy-needs.png)

To reach the Mlops level you have to achieve a few steps before you can reach
 the next level. You cannot, for example, have DataOps without first
  implementing devops.

You need to achieve one step of the bottom

## MLOps Maturity Levels

 there are several different phases of going from a crude working where you can
  barely get things into production and things are error-prone and manual all
   the way to a very sophisticated system that has really end-to-end automation
    and uses the next-generation features.

1.  _Initial step_: Experimentation. Establish the experimentation environment.
2.  _Repeatable_: standardize your code, your repos, make sure that there's maybe
    a platform that you're using that can actually deploy the solution.
3.  _Reliable_: Test, monitoring, data drift, model versions.
4.  _Scalable_: You're able to templatize and productionize a lot of different ML
    solutions, not just one, but actually have a scalable system that you can
     repeat over and over again

| Level | Description | Highlights | Technology |
| --- | --- | --- | --- |
| 0 | No MLOps | <ul><li>Difficult to manage full machine learning model
 lifecycle</li><li>The teams are disparate and releases are painful</li><li>Most systems exist as "black boxes," little feedback during/post deployment</li><li>Manual builds and deployments</li><li>Manual testing of model and application</li><li>No centralized tracking of model performance</li><li>Training of model is manual</li></ul> |  |
| 1 | DevOps but no MLOps | <ul><li>Releases are less painful than No MLOps, but rely on Data Team for every new model</li><li>Still limited feedback on how well a model performs in production</li><li>Difficult to trace/reproduce results</li></ul> | <ul><li>Automated builds</li><li>Automated tests for application code</li></ul> |
| 2 | Automated Training | <ul><li>Training environment is fully managed and traceable</li><li>Easy to reproduce model</li><li>Releases are manual, but low friction</li></ul> | <ul><li>Automated model training</li><li>Centralized tracking of model training performance</li><li>Model management</li></ul> |
| 3 | Automated Model Deployment | <ul><li>Releases are low friction and automatic</li><li>Full traceability from deployment back to original data</li><li>Entire environment managed: train > test > production</li></ul> | <ul><li>Integrated A/B testing of model performance for deployment</li><li>Automated tests for all code</li><li>Centralized tracking of model training performance</li></ul> |
| 4 | Full MLOps Automated Operations | <ul><li>Full system automated and easily monitored</li><li>Production systems are providing information on how to improve and, in some cases, automatically improve with new models</li><li>Approaching a zero-downtime system</li></ul> | <ul><li>Automated model training and testing</li><li>Verbose, centralized metrics from deployed model</li></ul> |

## Level 0: No MLOps

* **People:** Data scientists, data engineers, and software engineers are siloed and not in regular communications.

* **Model Creation:** Data is gathered manually, compute is likely not managed,
   experiments aren't predictably tracked, and the end result may be a single
    model file manually handed off.
* **Model Release:** The release process is manual, and the scoring script may
   be manually created well after experiments without version control.
* **Application Integration:** Heavily reliant on data scientist expertise to
   implement and manual releases each time.

## Level 1: DevOps no MLOps

* **People:** Same as Level 0.

* **Model Creation:** Data pipeline gathers data automatically, but compute may
   not be managed, and experiments aren't predictably tracked.
* **Model Release:** Still a manual process, but the scoring script is likely
   version controlled and is handed off to software engineers.
* **Application Integration:** Basic integration tests exist, but still heavily
   reliant on data scientist expertise. However, releases are automated and application code has unit tests.

## Level 2: Automated Training

* **People:** Data scientists work directly with data engineers to convert
   experimentation code into repeatable scripts/jobs, while software engineers
    remain siloed.

* **Model Creation:** Data pipeline gathers data automatically, compute is
   managed, experiment results are tracked, and both training code and
 resulting models are version controlled.
* **Model Release:** Manual release, but the scoring script is version
   controlled with tests and the release is managed by the software engineering
    team.
* **Application Integration:** Same as Level 1.

## Level 3: Automated Model Deployment

* **People:** Data scientists and data engineers work together and also with
   software engineers to manage inputs/outputs and automate model integration
    into application code.

* **Model Creation:** Same as Level 2.
* **Model Release:** Release is automatic and managed by a continuous delivery
   (CI/CD) pipeline.
* **Application Integration:** Unit and integration tests exist for each model
   release, and the process is less reliant on data scientist expertise.
    Application code has unit/integration tests..

## Level 4: Full MLOps Automated Retraining

* **People:** All roles work together, with software engineers implementing
   post-deployment metrics gathering.

* **Model Creation:** Similar to Level 3, but retraining is triggered
   automatically based on production metrics.
* **Model Release:** Same as Level 3.

#  References

* [Google Mlops levels](https://cloud.google.com/architecture/mlops-continuous-delivery-and-automation-pipelines-in-machine-learning)
* [Microsoft Mlops levels](https://learn.microsoft.com/en-us/azure/architecture/example-scenario/mlops/mlops-maturity-model#level-0-no-mlops)
