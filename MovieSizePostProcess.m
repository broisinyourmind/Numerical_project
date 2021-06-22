function outputFullFileName = MovieSizePostProcess(inputFullFileName)
%將輸入的影片不是偶數的那邊修正成偶數
% 輸入檔案的名字，與指定的x, y大小，即會自動輸出附有_processed檔名的影片檔，並輸出檔名

fontSize = 22;
inputVideoReaderObject = VideoReader(inputFullFileName);
numberOfFrames = inputVideoReaderObject.NumFrames;

Height = inputVideoReaderObject.Height;
Width = inputVideoReaderObject.Width;
Height_is_even = mod(Height,2);
Width_is_even = mod(Width,2);

if ~Height_is_even && ~Width_is_even
    outputFullFileName = inputFullFileName;
    return
elseif Height_is_even && ~Width_is_even
    outputVideoRows = Width;
    outputVideoColumns = outputVideoRows;
elseif ~Height_is_even && Width_is_even
    outputVideoRows = Height;
    outputVideoColumns = outputVideoRows;
else
    if Height >= Width
        outputVideoRows = Height-1;
        outputVideoColumns = outputVideoRows;
    else
        outputVideoRows = Width-1;
        outputVideoColumns = outputVideoRows;
    end
end

dotPosition = strfind(inputFullFileName, '.');
rawFileName = inputFullFileName(1:dotPosition-1);
extensionType = inputFullFileName(dotPosition:length(inputFullFileName));

outputFullFileName = strcat(rawFileName, '_resized', extensionType);
outputVideoWriterObject = VideoWriter(outputFullFileName);
outputVideoWriterObject.FrameRate = inputVideoReaderObject.FrameRate;

open(outputVideoWriterObject);

numberOfFramesWritten = 0;
figure(95);
set(gcf, 'units','normalized','outerposition',[0.1 0.1 0.9 0.9]);

for frame = 1 : numberOfFrames
	thisInputFrame = read(inputVideoReaderObject, frame);
	
	image(thisInputFrame);
	axis off;
    axis image;
    caption = sprintf('Frame %4d of %d.', frame, numberOfFrames);
    title(caption, 'FontSize', fontSize);
    drawnow;
    
    outputFrame = imresize(thisInputFrame, [outputVideoRows, outputVideoColumns]);
    
    writeVideo(outputVideoWriterObject, outputFrame);
    
%     fprintf('Processed frame %4d of %d.\n', frame, numberOfFrames);
    
    numberOfFramesWritten = numberOfFramesWritten + 1;
    
end

close(95);
close(outputVideoWriterObject);

end

