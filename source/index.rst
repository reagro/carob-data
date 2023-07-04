.. intro 

Carob
=====

The *Carob* project cleans and transforms agricultural research data from experiments and surveys into a standard format, and aggregates individual data sets into larger databases that can be used in further research. The data that we have compiled so far is described `here <data.html>`_. You can `download <download.html>`_ compiled data from this site, or generate them yourself using the *Carob* `scripts <https://github.com/reagro/carob>`_.

This is an open-source, collaborative, community project to which you can `contribute <contribute.html>`_! All data transformations are done with *R* scripts, making it easy to enhance the workflows as needs arise, and to correct mistakes.

There now is a substantial amount of raw primary research data available, especially from the `CGIAR  <https://gardian.bigdata.cgiar.org>`_ international agricultural research centers. This provides ample opportunity to combines these data to address important additional research questions (here is `an example <https://www.nature.com/articles/s43016-021-00370-1>`_). Unfortunately, it is very time consuming to re-use research data. This is because, with a few exceptions, each dataset is organized differently. Datasets have their own set of variable names, accepted values, and file structures. Even two files *within* a dataset may have discrepancies. Moreover, the published data is often incomplete and needs to be augmented with information gleaned from publications. Most datasets also have mistakes, especially in the location data and spelling. These mistakes can often be corrected (or removed), but doing that can be very time consuming. 

This is the problem that *Carob* aims to solve. *Carob* makes it much easier to reuse raw research data. Once a script has been written to standardize a dataset, these data can be readily used by others as well. Or you can using a script and expand it, for example, to include additional variables, without having to start from scratch. 

We also hope that by using the *Carob standards* and the tools to check datasets for being compliant (implemented in the *R* package "carobiner"), researchers will be able to improve the quality of the datasets that they create. This would make their own research more efficient and effective. Their work would also have more visibility and impact, as more people would work with the data once they are published. 


.. image:: /_static/carob.png
  :width: 125
  :alt: CAROB logo
  :target: https://github.com/reagro/carob

.. image:: /_static/eia-logo.png
  :width: 150
  :alt: EiA logo
  :target: https://www.cgiar.org/initiative/11-excellence-in-agronomy-eia-solutions-for-agricultural-transformation/

.. toctree::
	:hidden:
	:maxdepth: 3

	data
	download
	contribute
