clear
face_bout ={};
clip_spreadsheet = '/Users/tawnytsang/Dropbox/Bilingual JA Faces/Movie_timingFile.xlsx';

% % % % CLIPS:
[armenian_hungry, txt, raw] = xlsread(clip_spreadsheet,'Armenian_hungry','B:F');
[armenian_morning, txt, raw] = xlsread(clip_spreadsheet,'Armenian_morning','B:F');
[armenian_zoo, txt, raw] = xlsread(clip_spreadsheet,'Armenian_zoo','B:F');
[english_hungry, txt, raw] = xlsread(clip_spreadsheet,'English_hungry','B:F');
[english_morning, txt, raw] = xlsread(clip_spreadsheet,'English_morning','B:F');
[english_zoo, txt, raw] = xlsread(clip_spreadsheet,'English_zoo','B:F');


endFrame=max(armenian_hungry(:,2));
% replace start of frames to be frame # 1
armenian_hungry(find(armenian_hungry(:,1)==0),1)=1;
% FrameCount=ones(endFrame,1)*10;
% % Movement Frames
%frames that people are moving: 
movement=armenian_hungry(find(armenian_hungry(:,5)==2),:);
speaker1_index = movement(find(movement(:,4)==1),:);
speaker2_index = movement(find(movement(:,4)==2),:);

%pre-allocate your movement matrices 
speaker1_AH_movement=ones(endFrame,1)*10;
speaker2_AH_movement=ones(endFrame,1)*10;

%for duration of speaker 1/2 mvt, indicate if it was L, R, or straight on.
for i = 1:size(speaker1_index,1)
    speaker1_AH_movement(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_AH_movement(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index
AH_movement=[speaker1_AH_movement speaker2_AH_movement];

% % Speaking Frames

% index of frames of speaking and direction of head
speaking=armenian_hungry(find(armenian_hungry(:,5)==1),:);
speaker1_index = speaking(find(speaking(:,4)==1),:);
speaker2_index = speaking(find(speaking(:,4)==2),:);
 
%preallocate the speaker frames
speaker1_AH_speaking=ones(endFrame,1)*10;
speaker2_AH_speaking=ones(endFrame,1)*10;

%Indicate direction of the speaker

%let it be known that 0=straight on 1= L to R, 2= R to L
%Speaker 1 is on the L, speaker 2 is on the R
for i = 1:size(speaker1_index,1)
    speaker1_AH_speaking(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_AH_speaking(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index movement speaking
AH_speaking=[speaker1_AH_speaking speaker2_AH_speaking];

AH_coded_mat=[AH_movement AH_speaking];
save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/matlab/ArmenianHungry_coded_mat', 'AH_coded_mat');

% % % ARMENIAN MORNING

endFrame=max(armenian_morning(:,2));
armenian_morning(find(armenian_morning(:,1)==0),1)=1;
% FrameCount=ones(endFrame,1)*10;
% % Movement Frames
movement=armenian_morning(find(armenian_morning(:,5)==2),:);
speaker1_index = movement(find(movement(:,4)==1),:);
speaker2_index = movement(find(movement(:,4)==2),:);
 
speaker1_AM_movement=ones(endFrame,1)*10;
speaker2_AM_movement=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_AM_movement(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_AM_movement(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index
AM_movement=[speaker1_AM_movement speaker2_AM_movement];
 
% % Speaking Frames
speaking=armenian_morning(find(armenian_morning(:,5)==1),:);
speaker1_index = speaking(find(speaking(:,4)==1),:);
speaker2_index = speaking(find(speaking(:,4)==2),:);
 
speaker1_AM_speaking=ones(endFrame,1)*10;
speaker2_AM_speaking=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_AM_speaking(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_AM_speaking(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index movement speaking
AM_speaking=[speaker1_AM_speaking speaker2_AM_speaking];
 
AM_coded_mat=[AM_movement AM_speaking];
save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/matlab/ArmenianMorning_coded_mat', 'AM_coded_mat');

endFrame=max(armenian_zoo(:,2));
armenian_zoo(find(armenian_zoo(:,1)==0),1)=1;
% FrameCount=ones(endFrame,1)*10;
% % Movement Frames
movement=armenian_zoo(find(armenian_zoo(:,5)==2),:);
speaker1_index = movement(find(movement(:,4)==1),:);
speaker2_index = movement(find(movement(:,4)==2),:);
 
speaker1_AZ_movement=ones(endFrame,1)*10;
speaker2_AZ_movement=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_AZ_movement(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_AZ_movement(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index
AZ_movement=[speaker1_AZ_movement speaker2_AZ_movement];
 
% % Speaking Frames
speaking=armenian_zoo(find(armenian_zoo(:,5)==1),:);
speaker1_index = speaking(find(speaking(:,4)==1),:);
speaker2_index = speaking(find(speaking(:,4)==2),:);
 
speaker1_AZ_speaking=ones(endFrame,1)*10;
speaker2_AZ_speaking=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_AZ_speaking(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_AZ_speaking(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index movement speaking
AZ_speaking=[speaker1_AZ_speaking speaker2_AZ_speaking];
 
AZ_coded_mat=[AZ_movement AZ_speaking];
save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/matlab/ArmenianZoo_coded_mat', 'AZ_coded_mat');

endFrame=max(english_hungry(:,2));
english_hungry(find(english_hungry(:,1)==0),1)=1;
% FrameCount=ones(endFrame,1)*10;
% % Movement Frames
movement=english_hungry(find(english_hungry(:,5)==2),:);
speaker1_index = movement(find(movement(:,4)==1),:);
speaker2_index = movement(find(movement(:,4)==2),:);
 
speaker1_EH_movement=ones(endFrame,1)*10;
speaker2_EH_movement=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_EH_movement(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_EH_movement(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index
EH_movement=[speaker1_EH_movement speaker2_EH_movement];
 
% % Speaking Frames
speaking=english_hungry(find(english_hungry(:,5)==1),:);
speaker1_index = speaking(find(speaking(:,4)==1),:);
speaker2_index = speaking(find(speaking(:,4)==2),:);
 
speaker1_EH_speaking=ones(endFrame,1)*10;
speaker2_EH_speaking=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_EH_speaking(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_EH_speaking(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index movement speaking
EH_speaking=[speaker1_EH_speaking speaker2_EH_speaking];
 
EH_coded_mat=[EH_movement EH_speaking];
save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/matlab/englishhungry_coded_mat', 'EH_coded_mat');


% % % % ENGLISH MORNING


endFrame=max(english_morning(:,2));
english_morning(find(english_morning(:,1)==0),1)=1;
% FrameCount=ones(endFrame,1)*10;
% % Movement Frames
movement=english_morning(find(english_morning(:,5)==2),:);
speaker1_index = movement(find(movement(:,4)==1),:);
speaker2_index = movement(find(movement(:,4)==2),:);
 
speaker1_EM_movement=ones(endFrame,1)*10;
speaker2_EM_movement=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_EM_movement(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_EM_movement(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index
EM_movement=[speaker1_EM_movement speaker2_EM_movement];
 
% % Speaking Frames
speaking=english_morning(find(english_morning(:,5)==1),:);
speaker1_index = speaking(find(speaking(:,4)==1),:);
speaker2_index = speaking(find(speaking(:,4)==2),:);
 
speaker1_EM_speaking=ones(endFrame,1)*10;
speaker2_EM_speaking=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_EM_speaking(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_EM_speaking(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index movement speaking
EM_speaking=[speaker1_EM_speaking speaker2_EM_speaking];
 
EM_coded_mat=[EM_movement EM_speaking];
save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/matlab/englishmorning_coded_mat', 'EM_coded_mat');




endFrame=max(english_zoo(:,2));
english_zoo(find(english_zoo(:,1)==0),1)=1;
% FrameCount=ones(endFrame,1)*10;
% % Movement Frames
movement=english_zoo(find(english_zoo(:,5)==2),:);
speaker1_index = movement(find(movement(:,4)==1),:);
speaker2_index = movement(find(movement(:,4)==2),:);
 
speaker1_EZ_movement=ones(endFrame,1)*10;
speaker2_EZ_movement=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_EZ_movement(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_EZ_movement(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index
EZ_movement=[speaker1_EZ_movement speaker2_EZ_movement];
 
% % Speaking Frames
speaking=english_zoo(find(english_zoo(:,5)==1),:);
speaker1_index = speaking(find(speaking(:,4)==1),:);
speaker2_index = speaking(find(speaking(:,4)==2),:);
 
speaker1_EZ_speaking=ones(endFrame,1)*10;
speaker2_EZ_speaking=ones(endFrame,1)*10;
 
for i = 1:size(speaker1_index,1)
    speaker1_EZ_speaking(speaker1_index(i,1):speaker1_index(i,2))=speaker1_index(i,3);
end
clear i 
for i = 1:size(speaker2_index,1)
    speaker2_EZ_speaking(speaker2_index(i,1):speaker2_index(i,2))=speaker2_index(i,3);
end
clear i clear speaker1_index speaker2_index movement speaking
EZ_speaking=[speaker1_EZ_speaking speaker2_EZ_speaking];
 
EZ_coded_mat=[EZ_movement EZ_speaking];
save('/Users/tawnytsang/Desktop/Projects/BabyLab/BiJAFaces/matlab/englishZoo_coded_mat', 'EZ_coded_mat');

