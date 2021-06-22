close all
clear
clc

% movieName = {'BeachTree.avi','garbage.avi','land_population.avi','news.avi','pie.avi','population.avi','temperature.avi','Tree_Air_Chopped.avi'};
% 沒必要對BeachTree.avi和Tree_Air_Chopped.avi做處理
movieName = {'news.avi','pie.avi','population.avi','temperature.avi'};
Row = 500;
Column = 500;
FrameRate = 30;

% 先進行畫面數擴增再放大畫面
for ii = 1:numel(movieName)
    OriginalName = movieName{ii};
    RatedName = FrameRateController(OriginalName, FrameRate);
    ResizedName = MovieResizer(RatedName, Row, Column);
end
