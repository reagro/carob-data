.. raw:: html

   <div style="visibility: hidden;">

Introduction
============

.. raw:: html

   </div>
   <div style="visibility: visible;">

*Carob* is a community project that uses a collaborative and open-source approach to **standardize and aggregate** open agricultural research data from experiments and surveys. The goal is to facilitate the further use of these data in research and development.

The project used *R* scripts to standardize individual data sets. We follow the `terminag <https://github.com/reagro/terminag>`__ standard and use *R* package `carobiner <https://github.com/reagro/carobiner>`__ to check for compliance, and to compile the data. The data that we have compiled so far are described `here <data.html>`_. You can download some of the standardized data from this site; and you can also use the scripts to generate all the data `yourself <compile.html>`__.

There now is a substantial amount of raw primary research data available, especially from the `CGIAR  <https://gardian.bigdata.cgiar.org>`_ international agricultural research centers --- thanks to their `open-data policy <http://library.cgiar.org/bitstream/handle/10947/4488/Open%20Access%20Data%20Management%20Policy.pdf?sequence=1>`__. Other important providers of open agricultural research data include `CIRAD <https://dataverse.cirad.fr/>`__, `Wageningen UR <https://research.wur.nl/en/datasets/>`__ and `Rothamstead Research <https://www.rothamsted.ac.uk/data-repositories-model-and-software>`__. This provides ample opportunity to combines these data to address important additional research questions (here is `an example <https://www.nature.com/articles/s43016-021-00370-1>`_). 

Unfortunately, it can be very difficult and time consuming to re-use existing research data. This is because, with a few exceptions, each dataset is organized differently. Datasets have their own set of variable names, accepted values, units, and file structures. Even two files *within* a dataset may have discrepancies. Moreover, the published data is often incomplete and needs to be augmented with information gleaned from publications. Most datasets also have mistakes, especially in the location data and spelling. These mistakes can often be corrected (or removed), but doing that can be very time consuming. 

*Carob* scripts solve this problem and make research data accessible for reuse. 

We also hope that by using the `terminag <https://github.com/reagro/terminag>`__ standard; and the tools to check datasets for being compliant (implemented in the *R* package "carobiner" available on `github <https://github.com/reagro/carobiner>`_), researchers will be able to improve the quality of the new datasets that they create. First and foremost, because this would make their own research more efficient and effective. Their work would also have more visibility and impact, as more people would work with the data once they are published. 

*Carob* is the *Extract, Transform, and Load* `(ETL) framework supported by CGIAR <https://www.cgiar.org/initiative/excellence-in-agronomy/>`_ to support predictive agronomy analytics (machine learning). All data transformations are done with *R* scripts, making it easy to enhance the standardization process as needs arise, and to correct mistakes. Please consider `contributing <contribute/index.html>`_! 

.. raw:: html

   </div>
