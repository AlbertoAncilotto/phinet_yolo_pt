FROM  nvcr.io/nvidia/pytorch:22.06-py3
ARG DEBIAN_FRONTEND=noninteractive
# RUN sudo rm /etc/apt/sources.list.d/cuda.list
# RUN sudo rm /etc/apt/sources.list.d/nvidia-ml.list
RUN apt-get update \
 && apt-get install -y ffmpeg libsm6 libxext6 vim
COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
WORKDIR /App