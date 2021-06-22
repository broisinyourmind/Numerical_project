function outputFullFileName = Movie_Resize_Reframe(inputFullFileName, outputVideoRows, outputVideoColumns, frameRateNeeded)
%將輸入的影片重塑成指定大小輸出並修改每秒畫面數
% 輸入檔案的名字，指定的x, y大小與每秒畫面數，即會自動輸出附有_edited檔名的影片檔，並輸出檔名

fontSize = 22;
inputVideoReaderObject = VideoReader(inputFullFileName);
numberOfFrames = inputVideoReaderObject.NumFrames;
videoDuration = inputVideoReaderObject.Duration;
frameRateRatio = frameRateNeeded/numberOfFrames;

dotPosition = strfind(inputFullFileName, '.');
rawFileName = inputFullFileName(1:dotPosition-1);
extensionType = inputFullFileName(dotPosition:length(inputFullFileName));

outputFullFileName = strcat(rawFileName, '_edited', extensionType);
outputVideoWriterObject = VideoWriter(outputFullFileName);

outputVideoWriterObject.FrameRate = frameRateNeeded;

open(outputVideoWriterObject);
numberOfFramesWritten = 0;
figure(91);
set(gcf, 'units','normalized','outerposition',[0.1 0.1 0.9 0.9]);

for frame = 1 : round(videoDuration*frameRateNeeded)
    if round(frame/frameRateRatio) == 0
        frameToRead = 1;
    else
        frameToRead = ceil((frame/round(videoDuration*frameRateNeeded))*numberOfFrames);
    end
    
    if frameToRead >= numberOfFrames
        frameToRead = numberOfFrames;
    end
        
    thisInputFrame = read(inputVideoReaderObject, frameToRead);
    
	image(thisInputFrame);
	axis off;
	axis image;
	caption = sprintf('Frame %4d of %d.', frame, round(videoDuration*frameRateNeeded));
    title(caption, 'FontSize', fontSize);
    drawnow;
    
    thisOutputFrame = getframe;
    
    outputFrame = imresize(thisOutputFrame.cdata, [outputVideoRows, outputVideoColumns]);
    
    writeVideo(outputVideoWriterObject, outputFrame);
    
    numberOfFramesWritten = numberOfFramesWritten + 1;

end

close(91);
close(outputVideoWriterObject);

end

