# Benchmark for sentiment analysis
Sentiment Analysis is a binary classification task. It predicts positive or negative sentiment using raw user text. The IMDB dataset is used for this benchmark.

## Runtime configuration
Suggested environment : Ubuntu 16.04, 8 CPUs, one P100, 20GB disk


First, get cuda 8.0:

    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install cuda-8.0

Or get, cuda 9.0:

    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
    sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
    sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
    sudo apt-get update
    sudo apt-get install cuda


Next, install docker:

    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"
    sudo apt update
    sudo apt install docker-ce -y


Next, install nvidia-container-toolkit:

    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/urces.list.d/nvidia-docker.list
    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
    sudo systemctl restart docker

Next, install popper:

    pip install popper
*You can use a virtual envionment to install popper*

***

### Start Benchmark

Go inside the project folder:

    git clone <url>
    cd ml_benchmark/sentiment_analysis

To start training in CPU mode:
```
popper run
```
To start training in GPU mode:
```
popper run --rt-args="--gpu all" --wfile ./cuda.workflow
```

Training stops when the model reaches the pre-defined target quality.

# 3. Dataset/Environment
### Publication/Attribution
[IMDB Dataset](http://ai.stanford.edu/~amaas/data/sentiment/) provides 50000 movie reviews for sentiment analysis.

Maas, A. L.; Daly, R. E.; Pham, P. T.; Huang, D.; Ng, A. Y. & Potts, C. (2011), Learning Word Vectors for Sentiment Analysis, in 'Proceedings of the 49th Annual Meeting of the Association for Computational Linguistics: Human Language Technologies', Association for Computational Linguistics, Portland, Oregon, USA, pp. 142--150.
### Data preprocessing
The dataset isn't preprocessed in any way.
### Training and test data separation
The entire dataset is split into training and test sets. 25000 reviews are used for training and 25000 are used for validation.
This split is pre-determined and cannot be modified.
### Training data order
Training data is traversed in a randomized order.
### Test data order
Test data is evaluated in a fixed order.
# 4. Model
### Publication/Attribution
Convolution neural network based on Johnson, R. and Zhang, T. (2014), [Effective use of word order for text categorization with convolutional neural networks](https://arxiv.org/abs/1412.1058), CoRR abs/1412.1058. 

We have also included an LSTM based model from inspired by the following two papers: [Supervised and Semi-Supervised Text Categorization using LSTM for Region Embeddings](https://arxiv.org/abs/1602.02373) and [Semi-supervised Sequence Learning](https://arxiv.org/abs/1511.01432). In future versions of the benchmark, we intend to update the benchmark to train on a larger dataset. This LSTM based model would be useful for training on larger datasets.

### List of layers
The model consists of an embedding layer followed by two sequence convolution layers and cross entropy cost layer.
### Weight and bias initialization
Weights are initialized using Xavier initialization method and biases are initialized to zero.
### Loss function
Cross entropy loss function is used for computing the loss.
### Optimizer
Adam is used for optimization.
# 5. Quality
### Quality metric
Average accuracy for all samples in the test set.
### Quality target
Average accuracy of 90.6%
### Evaluation frequency
All test samples are evaluated once per epoch.
### Evaluation thoroughness
All test samples are evaluated once per epoch.