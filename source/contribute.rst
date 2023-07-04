Contribute
==========

*Carob* is an open-source community project that standardizes and aggregates agricultural research data.
 
Anyone is invited to contribute to *Carob* by writing an `R` script for a dataset of interest, or by improving an existing script. All scripts are available on the `github <https://github.com/reagro/carob/>`_ site (in the ``scripts`` folder).

A great place to discover new data sets is the `Gardian <https://gardian.bigdata.cgiar.org>`_ website.
Also see our `to-do list <todo.html>`_ for ideas (and check our `done list <done.html>`_ to make sure you do not replicate what has already been done).

The best approach to contributing is to follow these steps

1. **fork** the *Carob* `repo <https://github.com/reagro/carob/>`_ to your github account. 
2. **clone** the forked repo to your computer.
3. **install** `R` package "carobiner" with ``remotes::install_github("reagro/carobiner")``
4. add a new `R` **script**, or make the changes to an existing script (follow the `guidelines <https://github.com/reagro/carob/wiki/Guidelines>`_).
5. **check** your work by running ``carobiner::run_carob()`` for the new or changed `R` script.
6. **push** these changes to the forked repo on your github account.
7. **sync** the forked repo with main repo in reagro/carob such that your fork is not behind.
8. create a **pull request** to integrate your changes into the main repo. Keep pull requests simple. Ideally, they should consist of only one file at at time. 

If this procedure is too complicated we can also work with you in other ways. You can always drop us an email at carob.data@gmail.com, or raise an `issue <https://github.com/reagro/carob/issues>`_

