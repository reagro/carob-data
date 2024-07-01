Introduction
============

*Carob* is an open-source, collaborative and community project that standardized agricultural research data from experiments and surveys. We produce (1) scripts to standardize open research data and (2) aggregated data sets that can be used in research and development.

We use the `terminag <https://github.com/reagro/terminag>`__ standard and the `carobiner <https://github.com/reagro/carobiner>`__ *R* package to check for compliance with this standard and compile the data.

The data that we have compiled so far is described `here <aggregated.html>`_. You can `download <download.html>`_ compiled data from this site, or generate them yourself using the *Carob* `scripts <https://github.com/reagro/carob>`_.

There now is a substantial amount of raw primary research data available, especially from the `CGIAR  <https://gardian.bigdata.cgiar.org>`_ international agricultural research centers. This provides ample opportunity to combines these data to address important additional research questions (here is `an example <https://www.nature.com/articles/s43016-021-00370-1>`_). Unfortunately, it is very time consuming to re-use research data. This is because, with a few exceptions, each dataset is organized differently. Datasets have their own set of variable names, accepted values, units, and file structures. Even two files *within* a dataset may have discrepancies. Moreover, the published data is often incomplete and needs to be augmented with information gleaned from publications. Most datasets also have mistakes, especially in the location data and spelling. These mistakes can often be corrected (or removed), but doing that can be very time consuming. 

*Carob* scripts solve this problem and make research data accessible for reuse. 

We also hope that by using the `terminag <https://github.com/reagro/terminag>`__ standard; and the tools to check datasets for being compliant (implemented in the *R* package "carobiner" available on `github <https://github.com/reagro/carobiner>`_), researchers will be able to improve the quality of the datasets that they create. This would make their own research more efficient and effective. Their work would also have more visibility and impact, as more people would work with the data once they are published. 

*Carob* is the *Extract, Transform, and Load* `(ETL) framework supported by CGIAR <https://www.cgiar.org/initiative/excellence-in-agronomy/>`_ to support predictive agronomy analytics. All data transformations are done with *R* scripts, making it easy to enhance the standardization process as needs arise, and to correct mistakes. Please consider `contributing <contribute.html>`_! 

