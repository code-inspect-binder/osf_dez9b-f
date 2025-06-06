# Executable Environment for OSF Project [dez9b](https://osf.io/dez9b/)

This repository was automatically generated as part of a project to test the reproducibility of open science projects hosted on the Open Science Framework (OSF).

**Project Title:** Testing Bayesian Informative Hypotheses in 5 steps with R and JASP

**Project Description:**
> One of the most common applications of Bayes’ theorem for inferential purposes consists of computing the ratio between the probability of the alternative and the null hypotheses via a Bayes factor, which allows quantifying the most likely explanation of the data between the two. However, the actual scientific questions that researchers are interested in are rarely well represented by the classically defined alternative and null hypotheses. Bayesian informative hypothesis testing offers a valid and easy way to overcome such limitations via a model selection procedure that allows comparing highly specific hypotheses formulated in terms of equality (A = B) or inequality (A &gt; B) constraints amongst parameters. Although packages for testing informative hypotheses in the most used statistical software have been developed in recent years, they are still rarely used, possibly because their implementation and interpretation may not be straightforward. Starting from a brief theoretical overview of the Bayesian theorem and its applications in statistical inference (namely, Bayes factor and Bayesian testing of informative hypotheses), this paper provides two step-by-step tutorials illustrating how to test, interpret, and report in a scientific paper Bayesian informative hypotheses testing using JASP and R/RStudio software for running a 2x2 Anova and a multiple linear regression. The complete JASP files, R code, and datasets used in the paper are freely available on the OSF page https://osf.io/dez9b/. 

**Original OSF Page:** [https://osf.io/dez9b/](https://osf.io/dez9b/)

---

**Important Note:** The contents of the `dez9b_src` folder were cloned from the OSF project on **12-03-2025**. Any changes made to the original OSF project after this date will not be reflected in this repository.

The `DESCRIPTION` file was automatically added to make this project Binder-ready. For more information on how R-based OSF projects are containerized, please refer to the `osf-to-binder` GitHub repository: [https://github.com/Code-Inspect/osf-to-binder](https://github.com/Code-Inspect/osf-to-binder)

## flowR Integration

This version of the repository has the **[flowR Addin](https://github.com/flowr-analysis/rstudio-addin-flowr)** preinstalled. flowR allows visual design and execution of data analysis workflows within RStudio, supporting better reproducibility and modular analysis pipelines.

To use flowR, open the project in RStudio and go to `Addins` > `flowR`.

## How to Launch:

**Launch in your Browser:**

🚀 **MyBinder:** [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/code-inspect-binder/osf_dez9b-f/HEAD?urlpath=rstudio)

   * This will launch the project in an interactive RStudio environment in your web browser.
   * Please note that Binder may take a few minutes to build the environment.

🚀 **NFDI JupyterHub:** [![NFDI](https://nfdi-jupyter.de/images/nfdi_badge.svg)](https://hub.nfdi-jupyter.de/r2d/gh/code-inspect-binder/osf_dez9b-f/HEAD?urlpath=rstudio)

   * This will launch the project in an interactive RStudio environment on the NFDI JupyterHub platform.

**Access Downloaded Data:**
The downloaded data from the OSF project is located in the `dez9b_src` folder.

## Run via Docker for Long-Term Reproducibility

In addition to launching this project using Binder or NFDI JupyterHub, you can reproduce the environment locally using Docker. This is especially useful for long-term access, offline use, or high-performance computing environments.

### Pull the Docker Image

```bash
docker pull meet261/repo2docker-dez9b-f:latest
```

### Launch RStudio Server

Run the container (with a name, e.g. `rstudio-dev`):
```bash
docker run -it --name rstudio-dev --platform linux/amd64 -p 8888:8787 --user root meet261/repo2docker-dez9b-f bash
```

Inside the container, start RStudio Server with no authentication:
```bash
/usr/lib/rstudio-server/bin/rserver --www-port 8787 --auth-none=1
```

Then, open your browser and go to: [http://localhost:8888](http://localhost:8888)

> **Note:** If you're running the container on a remote server (e.g., via SSH), replace `localhost` with your server's IP address.
> For example: `http://<your-server-ip>:8888`

## Looking for the Base Version?

For the original Binder-ready repository **without flowR**, visit:
[osf_dez9b](https://github.com/code-inspect-binder/osf_dez9b)

