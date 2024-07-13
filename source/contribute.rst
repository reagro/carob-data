.. raw:: html

   <div style="visibility: hidden;">


Contribute
==========

.. raw:: html

   </div>
   <div style="visibility: visible;">


*Carob* is an open-source community project to standardize and aggregate agricultural research data.
 
Anyone is invited to contribute to *Carob* by contributing `R` scripts for datasets of interest, or by improving existing scripts. All scripts are available on `github <https://github.com/reagro/carob/>`_ (in the ``scripts`` folder).

You can discover new data sets with the `Gardian <https://gardian.bigdata.cgiar.org>`_ search engine. You can also look at our `to-do list <todo.html>`_ for ideas (and do check our `done list <done.html>`_ to make sure you do not work on a dataset that has already been processed).

To contribute you can follow these steps

1. **fork** the *Carob* `repo <https://github.com/reagro/carob/>`_ to your github account. 
2. **clone** the forked repo to your computer.
3. **install** `R` package "carobiner" with ``remotes::install_github("reagro/carobiner")``
4. add a new `R` **script**, or make the changes to an existing script (follow the `guidelines <https://github.com/reagro/carob/wiki/Guidelines>`_).
5. **check** your work by running ``carobiner::run_carob()`` for the new or changed `R` script.
6. **push** these changes to the forked repo on your github account.
7. **sync** the forked repo with main repo in reagro/carob such that your fork is not behind.
8. create a **pull request** to integrate your changes into the main repo. Keep pull requests simple. Ideally, they should consist of only one file at at time. 

If this procedure is too complicated we can also work with you in other ways. You can always drop us an email at carob.data@gmail.com, or raise an `issue <https://github.com/reagro/carob/issues>`_


.. raw:: html

   </div>
