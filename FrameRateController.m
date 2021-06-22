function outputFullFileName = FrameRateController(inputFullFileName, frameRateNeeded)
%將輸入的影片的每秒畫面數更改為指定的數字，同時不影響播放時間
% 輸入檔案的名字，與指定每秒畫面數，即會自動輸出附有_rated檔名的影片檔，並輸出檔名

fontSize = 22;
inputVideoReaderObject = VideoReader(inputFullFileName);
numberOfFrames = inputVideoReaderObject.NumFrames;
videoDuration = inputVideoReaderObject.Duration;
frameRateRatio = frameRateNeeded/numberOfFrames;

dotPosition = strfind(inputFullFileName, '.');
rawFileName = inputFullFileName(1:dotPosition-1);
extensionType = inputFullFileName(dotPosition:length(inputFullFileName));

outputFullFileName = strcat(rawFileName, '_rated', extensionType);
outputVideoWriterObject = VideoWriter(outputFullFileName);
outputVideoWriterObject.FrameRate = frameRateNeeded;

open(outputVideoWriterObject);

numberOfFramesWritten = 0;
figure(92);
set(gcf, 'units','normalized','outerposition',[0.2 0.2 0.5 0.5]);

for frame = 1:round(videoDuration*frameRateNeeded)
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
    
    outputFrame = getframe;
    
    writeVideo(outputVideoWriterObject, outputFrame);
%     fprintf('Processed frame %4d of %d.\n', frame, round(videoDuration*frameRateNeeded));
    numberOfFramesWritten = numberOfFramesWritten + 1;
    
end

close(92);
close(outputVideoWriterObject);

end

