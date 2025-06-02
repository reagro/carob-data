Compile
=======


You can **compile** *Carob* data yourself if you have basic familiarity with the *git* and *R* software. 

1. Install software

  If you do not have these programs, first **install** the current version of *R* (`download it here <https://cran.r-project.org/>`__), and *git*. If you are not familiar with command line tools, you can install `github desktop <https://docs.github.com/en/desktop/installing-and-authenticating-to-github-desktop/installing-github-desktop>`__

2. Clone the *Carob* repo

  **clone** the *Carob* `repo <https://github.com/carob-data/carob/>`_ (repository) from github to your computer. You can use github desktop or another git program. On the command line you can use::

     git clone https://github.com/carob-data/carob.git

3. Install the carobiner package

  Open *R* and **install** `R` *package* "carobiner" with these line of R code:: 
     
	 # first install package "remotes" if need be
	 install.packages("remotes")
	 # install carobiner
	 remotes::install_github("reagro/carobiner")
	 

4. Compile

  In *R* you can now **run**::
   
      carobiner::make_carob("path")
	  
  where ``"path"`` needs to be replaced with the name of the folder where the carob repo was cloned to. E.g. ``"D:/github/carob"`` (note the forward slashes). Alternatively, on the command line, navigate to the carob repo folder and run ``build_carob.bat`` (or ``./build_carob.sh`` on linux). This will download all individual datasets and standardize them. The process will take some time the first time you run it.

5. Look at the data 

  **Navigate** to the "data/compiled" folder in the repo to find the data files. There should be data and metadata files for each `group <data.html>`__  

6. Update 

  Once in a while, to **update** to the latest version, you can do ``git pull`` and then run the commands described under #3 again. It is also good to regularly install the latest version of "carobiner" with::

    remotes::install_github("reagro/carobiner") 

