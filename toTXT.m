
images_to_txt('trainN.txt','trainN');
images_to_txt('testN.txt','testN');

function variable = images_to_txt(file_name,folder_name)

fileID = fopen(file_name,'w');


  imagespath =   dir( fullfile( folder_name,  '*.png') );
  
           
         for i = 1 : length(imagespath)
 
            fprintf(fileID,strcat(folder_name,'/','%s'),imagespath(i).name);
            
            FileName=imagespath(i).name
            
            bigin=strfind(FileName,'G');
            
            ending=strfind(FileName,'T');
            
            FileName=FileName(bigin(1)+1:ending(1)-2);
         
            fprintf(fileID,' %s\n',FileName); 

         end
         
          fclose(fileID);

          