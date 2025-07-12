{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyO667h3SeWrohUUDEUnNd0D"
    },
    "kernelspec": {
      "name": "python3",
      "display_name": "Python 3"
    },
    "language_info": {
      "name": "python"
    }
  },
  "cells": [
    {
      "cell_type": "code",
      "execution_count": 12,
      "metadata": {
        "colab": {
          "base_uri": "https://localhost:8080/"
        },
        "id": "D_W9IrH24Ncb",
        "outputId": "61dbc1e4-02f9-4b50-fd30-895ae9188d1a"
      },
      "outputs": [
        {
          "output_type": "stream",
          "name": "stdout",
          "text": [
            "Requirement already satisfied: deepface in /usr/local/lib/python3.11/dist-packages (0.0.93)\n",
            "Requirement already satisfied: requests>=2.27.1 in /usr/local/lib/python3.11/dist-packages (from deepface) (2.32.3)\n",
            "Requirement already satisfied: numpy>=1.14.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (2.0.2)\n",
            "Requirement already satisfied: pandas>=0.23.4 in /usr/local/lib/python3.11/dist-packages (from deepface) (2.2.2)\n",
            "Requirement already satisfied: gdown>=3.10.1 in /usr/local/lib/python3.11/dist-packages (from deepface) (5.2.0)\n",
            "Requirement already satisfied: tqdm>=4.30.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (4.67.1)\n",
            "Requirement already satisfied: Pillow>=5.2.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (11.2.1)\n",
            "Requirement already satisfied: opencv-python>=4.5.5.64 in /usr/local/lib/python3.11/dist-packages (from deepface) (4.11.0.86)\n",
            "Requirement already satisfied: tensorflow>=1.9.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (2.18.0)\n",
            "Requirement already satisfied: keras>=2.2.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (3.8.0)\n",
            "Requirement already satisfied: Flask>=1.1.2 in /usr/local/lib/python3.11/dist-packages (from deepface) (3.1.1)\n",
            "Requirement already satisfied: flask-cors>=4.0.1 in /usr/local/lib/python3.11/dist-packages (from deepface) (6.0.1)\n",
            "Requirement already satisfied: mtcnn>=0.1.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (1.0.0)\n",
            "Requirement already satisfied: retina-face>=0.0.1 in /usr/local/lib/python3.11/dist-packages (from deepface) (0.0.17)\n",
            "Requirement already satisfied: fire>=0.4.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (0.7.0)\n",
            "Requirement already satisfied: gunicorn>=20.1.0 in /usr/local/lib/python3.11/dist-packages (from deepface) (23.0.0)\n",
            "Requirement already satisfied: termcolor in /usr/local/lib/python3.11/dist-packages (from fire>=0.4.0->deepface) (3.1.0)\n",
            "Requirement already satisfied: blinker>=1.9.0 in /usr/local/lib/python3.11/dist-packages (from Flask>=1.1.2->deepface) (1.9.0)\n",
            "Requirement already satisfied: click>=8.1.3 in /usr/local/lib/python3.11/dist-packages (from Flask>=1.1.2->deepface) (8.2.1)\n",
            "Requirement already satisfied: itsdangerous>=2.2.0 in /usr/local/lib/python3.11/dist-packages (from Flask>=1.1.2->deepface) (2.2.0)\n",
            "Requirement already satisfied: jinja2>=3.1.2 in /usr/local/lib/python3.11/dist-packages (from Flask>=1.1.2->deepface) (3.1.6)\n",
            "Requirement already satisfied: markupsafe>=2.1.1 in /usr/local/lib/python3.11/dist-packages (from Flask>=1.1.2->deepface) (3.0.2)\n",
            "Requirement already satisfied: werkzeug>=3.1.0 in /usr/local/lib/python3.11/dist-packages (from Flask>=1.1.2->deepface) (3.1.3)\n",
            "Requirement already satisfied: beautifulsoup4 in /usr/local/lib/python3.11/dist-packages (from gdown>=3.10.1->deepface) (4.13.4)\n",
            "Requirement already satisfied: filelock in /usr/local/lib/python3.11/dist-packages (from gdown>=3.10.1->deepface) (3.18.0)\n",
            "Requirement already satisfied: packaging in /usr/local/lib/python3.11/dist-packages (from gunicorn>=20.1.0->deepface) (24.2)\n",
            "Requirement already satisfied: absl-py in /usr/local/lib/python3.11/dist-packages (from keras>=2.2.0->deepface) (1.4.0)\n",
            "Requirement already satisfied: rich in /usr/local/lib/python3.11/dist-packages (from keras>=2.2.0->deepface) (13.9.4)\n",
            "Requirement already satisfied: namex in /usr/local/lib/python3.11/dist-packages (from keras>=2.2.0->deepface) (0.1.0)\n",
            "Requirement already satisfied: h5py in /usr/local/lib/python3.11/dist-packages (from keras>=2.2.0->deepface) (3.14.0)\n",
            "Requirement already satisfied: optree in /usr/local/lib/python3.11/dist-packages (from keras>=2.2.0->deepface) (0.16.0)\n",
            "Requirement already satisfied: ml-dtypes in /usr/local/lib/python3.11/dist-packages (from keras>=2.2.0->deepface) (0.4.1)\n",
            "Requirement already satisfied: joblib>=1.4.2 in /usr/local/lib/python3.11/dist-packages (from mtcnn>=0.1.0->deepface) (1.5.1)\n",
            "Requirement already satisfied: lz4>=4.3.3 in /usr/local/lib/python3.11/dist-packages (from mtcnn>=0.1.0->deepface) (4.4.4)\n",
            "Requirement already satisfied: python-dateutil>=2.8.2 in /usr/local/lib/python3.11/dist-packages (from pandas>=0.23.4->deepface) (2.9.0.post0)\n",
            "Requirement already satisfied: pytz>=2020.1 in /usr/local/lib/python3.11/dist-packages (from pandas>=0.23.4->deepface) (2025.2)\n",
            "Requirement already satisfied: tzdata>=2022.7 in /usr/local/lib/python3.11/dist-packages (from pandas>=0.23.4->deepface) (2025.2)\n",
            "Requirement already satisfied: charset-normalizer<4,>=2 in /usr/local/lib/python3.11/dist-packages (from requests>=2.27.1->deepface) (3.4.2)\n",
            "Requirement already satisfied: idna<4,>=2.5 in /usr/local/lib/python3.11/dist-packages (from requests>=2.27.1->deepface) (3.10)\n",
            "Requirement already satisfied: urllib3<3,>=1.21.1 in /usr/local/lib/python3.11/dist-packages (from requests>=2.27.1->deepface) (2.4.0)\n",
            "Requirement already satisfied: certifi>=2017.4.17 in /usr/local/lib/python3.11/dist-packages (from requests>=2.27.1->deepface) (2025.7.9)\n",
            "Requirement already satisfied: astunparse>=1.6.0 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (1.6.3)\n",
            "Requirement already satisfied: flatbuffers>=24.3.25 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (25.2.10)\n",
            "Requirement already satisfied: gast!=0.5.0,!=0.5.1,!=0.5.2,>=0.2.1 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (0.6.0)\n",
            "Requirement already satisfied: google-pasta>=0.1.1 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (0.2.0)\n",
            "Requirement already satisfied: libclang>=13.0.0 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (18.1.1)\n",
            "Requirement already satisfied: opt-einsum>=2.3.2 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (3.4.0)\n",
            "Requirement already satisfied: protobuf!=4.21.0,!=4.21.1,!=4.21.2,!=4.21.3,!=4.21.4,!=4.21.5,<6.0.0dev,>=3.20.3 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (5.29.5)\n",
            "Requirement already satisfied: setuptools in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (75.2.0)\n",
            "Requirement already satisfied: six>=1.12.0 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (1.17.0)\n",
            "Requirement already satisfied: typing-extensions>=3.6.6 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (4.14.1)\n",
            "Requirement already satisfied: wrapt>=1.11.0 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (1.17.2)\n",
            "Requirement already satisfied: grpcio<2.0,>=1.24.3 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (1.73.1)\n",
            "Requirement already satisfied: tensorboard<2.19,>=2.18 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (2.18.0)\n",
            "Requirement already satisfied: tensorflow-io-gcs-filesystem>=0.23.1 in /usr/local/lib/python3.11/dist-packages (from tensorflow>=1.9.0->deepface) (0.37.1)\n",
            "Requirement already satisfied: wheel<1.0,>=0.23.0 in /usr/local/lib/python3.11/dist-packages (from astunparse>=1.6.0->tensorflow>=1.9.0->deepface) (0.45.1)\n",
            "Requirement already satisfied: markdown>=2.6.8 in /usr/local/lib/python3.11/dist-packages (from tensorboard<2.19,>=2.18->tensorflow>=1.9.0->deepface) (3.8.2)\n",
            "Requirement already satisfied: tensorboard-data-server<0.8.0,>=0.7.0 in /usr/local/lib/python3.11/dist-packages (from tensorboard<2.19,>=2.18->tensorflow>=1.9.0->deepface) (0.7.2)\n",
            "Requirement already satisfied: soupsieve>1.2 in /usr/local/lib/python3.11/dist-packages (from beautifulsoup4->gdown>=3.10.1->deepface) (2.7)\n",
            "Requirement already satisfied: PySocks!=1.5.7,>=1.5.6 in /usr/local/lib/python3.11/dist-packages (from requests[socks]->gdown>=3.10.1->deepface) (1.7.1)\n",
            "Requirement already satisfied: markdown-it-py>=2.2.0 in /usr/local/lib/python3.11/dist-packages (from rich->keras>=2.2.0->deepface) (3.0.0)\n",
            "Requirement already satisfied: pygments<3.0.0,>=2.13.0 in /usr/local/lib/python3.11/dist-packages (from rich->keras>=2.2.0->deepface) (2.19.2)\n",
            "Requirement already satisfied: mdurl~=0.1 in /usr/local/lib/python3.11/dist-packages (from markdown-it-py>=2.2.0->rich->keras>=2.2.0->deepface) (0.1.2)\n",
            "True\n",
            "0.3502233055627402\n"
          ]
        }
      ],
      "source": [
        "import json\n",
        "!pip install deepface\n",
        "from deepface import DeepFace\n",
        "img1_path = '/content/IMG_20241123_205532-removebg-preview.png'\n",
        "img2_path = '/content/WIN_20241227_12_43_27_Pro.jpg'\n",
        "\n",
        "\n",
        "result = DeepFace.verify(img1_path,img2_path )\n",
        "print(result['verified'])\n",
        "print(result['distance'])"
      ]
    }
  ]
}