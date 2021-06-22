close all
clear
clc

addpath('./mmread','./mmwrite');
OptName = MovieSizePostProcess('TestOutput.avi');
[~, audio] = mmread('music.mp3');
[video, ~] = mmread(OptName);
mmwrite('Test.wmv', audio, video);
