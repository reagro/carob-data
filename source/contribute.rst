.. raw:: html

   <div style="visibility: hidden;">


Contribute
==========

.. raw:: html

   </div>
   <div style="visibility: visible;">


*Carob* is an open-source community project to standardize and aggregate agricultural research data. You are invited to **contribute** to *Carob* by contributing `R` scripts for datasets of interest, or by improving existing scripts. All scripts are available on `github <https://github.com/reagro/carob/>`_ (in the ``scripts`` folder).

To contribute you can follow these steps

1. **fork** the *Carob* `repo <https://github.com/reagro/carob/>`_ to your github account. 
2. **clone** the forked repo to your computer.
3. **install** `R` package "carobiner" with ``remotes::install_github("reagro/carobiner")``
4. add a new `R` **script**, or make the changes to an existing script (follow the `guidelines <https://github.com/reagro/carob/wiki/Guidelines>`_).
5. **check** your work by running ``carobiner::run_carob()`` for the new or changed `R` script.
6. **push** these changes to the forked repo on your github account.
7. **sync** the forked repo with main repo in reagro/carob such that your fork is not behind.
8. create a **pull request** to integrate your changes into the main repo. Keep pull requests simple. They should normally consist of only one file at a time. 

If you find this procedure too daunting we can also try to work with you in other ways. You can drop us an email at carob.data@gmail.com, or raise an `issue <https://github.com/reagro/carob/issues>`_ on github.

You can discover new data sets with the `Gardian <https://gardian.bigdata.cgiar.org>`_ search engine. You can also look at our to-do list below for ideas. You can check our `done list <done.html>`_ to make sure you do not work on a dataset that has already been processed). But since there can be a delay in updating what is shown here, before you start working on a dataset, you should check with ``carobiner::on_github`` if it has already been done (and has been added to the github repo). 

.. raw:: html
   :file: _R/todo.html


.. raw:: html

   </div>
