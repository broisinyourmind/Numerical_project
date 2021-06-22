close all
clear
clc

% 依序輸入影片的排列順序
movieName = {'greedy1.avi','stealsand2.avi','growtree3.avi','forest4.avi','wind5.avi','clock6.avi','bubble7.avi','earth888.avi','earth9.avi'};
Row = 500;
Column = 500;
FrameRate = 30;

% 先進行畫面數擴增再放大畫面
for ii = 1:numel(movieName)
    NameOutput{ii} = Movie_Resize_Reframe(movieName{ii}, Row, Column, FrameRate);
end

% 影片連接
figure(93);
set(gcf, 'units','normalized','outerposition',[0.1 0.1 0.9 0.9]);

inputVideoReaderObject = VideoReader(NameOutput{1});
for kk = 1:inputVideoReaderObject.NumFrames
    nowPlayingFrame = read(inputVideoReaderObject, kk);
    image(nowPlayingFrame);
    axis off;
    axis image;
    drawnow;
    mov(kk)=getframe;
end

for jj = 2:numel(NameOutput)
    inputVideoReaderObject = VideoReader(NameOutput{jj});
    for kk = 1:inputVideoReaderObject.NumFrames
        nowPlayingFrame = read(inputVideoReaderObject, kk);
        image(nowPlayingFrame);
        axis off;
        axis image;
        drawnow;
        mov(numel(mov)+1)=getframe;
    end
end

movie(mov,1,30);
Video = VideoWriter('TestOutput.avi');
set(Video,'FrameRate',30);
open(Video);
writeVideo(Video,mov);
close(Video);
