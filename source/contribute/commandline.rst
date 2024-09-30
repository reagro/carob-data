:orphan:

command line
============

clone
-----

Now "clone" (make a copy of) your version of the repo (the fork) to your own computer. You can do that in different ways. With the command line it would be 

.. code

     git clone https://github.com/<MyAccount>/carob.git
	 
Where you need to replace `<MyAcount>` with your github account name. You only need to do this once. They other commands below are needed every time you make changes. 



pull
----

Before you make any changes you want to keep, you should check that your *remote repo* (your forked version on github) is not *behind* main repo (`reagro/carob <https://github.com/reagro/carob>`__) if so, you should *sychronize* your github hosted clone with the main repo. Now you can "pull" the latest version to your local repo.  

.. code

     git pull
	 
If you do not do this, you may create "conflicts" in which you make a change to a file that has already been edited by someone else. Conflicts can be resolved but it is best to avoid them.	 



status
------ 

Once you start working with the files of your fork of the repo, on your local computer, you can check which files exist in the folder but are not part of the repo (if any) and which files have changed with 

.. code

     git status 
	 
It is important to always run this command before using `git add` or `git commit`.


add
---

If you added a new file that you want to formally add to the your fork of the repo, you need to run 
 
.. code

     git add <scripts/agronomy/new_file.R>

where `<scripts/agronomy/new_file.R>` should be the actual filename


commit
------

Changes made to a file (including to a new file) need to be "committed" to the repo. You need to provide a short message describing the commit. For example "adding new file", or "fixed georeferencing error"

.. code

     git commit <scripts/agronomy/new_file.R> -m "a short message"


.. code

     git push

