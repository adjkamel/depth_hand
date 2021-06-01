### Hand Gesture Recognition from a Sigle Depth image
This repository contains parts of the code for the hand gesture recognition mentioned in the paper: [Deep gesture interaction for augmented anatomy learning](https://www.sciencedirect.com/science/article/abs/pii/S0268401217308678)
#### Requirements
- [Caffe](https://caffe.berkeleyvision.org/)
- Matlab 2016 or above
#### Dataset
The [Creative Senz3D](https://lttm.dei.unipd.it/downloads/gesture/#senz3d)  dataset contains gestures performed by 4 different people, each performing 11 different gestures repeated 30 times each, for a total of 1320 samples. For each sample, color, depth and confidence frames are available. Intrinsic parameters for the Creative Senz3D are also provided.
#### Preprocessing
- The data are in .bin format. In order to extract depth images for training, use bin_to_depth.m.
- To remove the background and crop the hand only, use preprocessing.m
#### Training
- The model designe for training and testing was created using Caffe deep learning framework,the training files are in Caffe/ (train.prototxt for training, deploy.prototxt for testing, and solver.prototxt for training parameters).
- The training files requires txt files contains a list of training images and testing like the trainN.txt and trainN.txt. In order to generate those files use toTXT.m file.

#### Results

Pretrained model:

https://drive.google.com/file/d/1H3HNb5B49yix0vM6Q_FLNim7AhrPhQWD/view?usp=sharing
https://drive.google.com/file/d/1uswq5SSQYPI_Q-tDHgUGoh8JT99S2N_7/view?usp=sharing

In order to generate the prediction results, use deploy file with the pretrained model.

Demo:

The prediction results (probability of the gesture to be the correct gesture) are stored in .mat file. Here we show the prediction result of the subject S4. To run the demo open this directory with matlab and run main.m file.

---
![ezgif com-gif-maker](https://user-images.githubusercontent.com/50513215/119239546-bcd0c900-bb41-11eb-9789-a6f5c3b09ca3.gif)

---
#### Citation
If you use this code for your research, please cite the following paper:
```
@article{karambakhsh2019deep,
  title={Deep gesture interaction for augmented anatomy learning},
  author={Karambakhsh, Ahmad and Kamel, Aouaidjia and Sheng, Bin and Li, Ping and Yang, Po and Feng, David Dagan},
  journal={International Journal of Information Management},
  volume={45},
  pages={328--336},
  year={2019},
  publisher={Elsevier}
}
```
