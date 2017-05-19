FROM jupyter/scipy-notebook:latest

USER root

SHELL ["/bin/bash", "-c"]

# In case you need aptitude installs
# RUN apt-get update

# Add the local dir at image build time
ADD . /home/jovyan/

# Download and install conda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -bf && rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH="/root/miniconda3/bin:${PATH}"

# Download the git archive (comment if not required)
RUN git clone http://bitbucket.org/scilifelab-lts/reproducible_research_example.git

# Use conda to install the course libraries
RUN conda config --add channels bioconda conda-forge
RUN conda create --name pycourse python=3.5 --file requirements.txt
RUN source activate pycourse

# conda has issues with the ipython kernel when inside environment
RUN ipython kernel install --user
RUN jupyter nbextension enable --py widgetsnbextension

# Example installing a specific library
RUN conda install --yes \
      'pytables=3.2*' && \
    conda clean -yt

CMD source activate pycourse;cd /home/jovyan/
