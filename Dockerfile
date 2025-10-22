FROM jupyter/scipy-notebook:python-3.11.4

RUN mamba install -y -n base -c conda-forge openjdk=11 && \
    mamba clean -afy

ENV JAVA_HOME=/opt/conda
ENV PATH=${JAVA_HOME}/bin:${PATH}


COPY --chown=${NB_UID}:${NB_GID} requirements.txt /tmp/
RUN pip install --quiet --no-cache-dir --requirement /tmp/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"