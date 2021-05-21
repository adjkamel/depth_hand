
for s = 1:4
for g = 1:11


d = dir(strcat('S',num2str(s),'\G',num2str(g),'\*.bin'));


data ='data\';


num_frames= length(d);


for i = 1:num_frames
    
      sss=d(i).name;

name=strcat('S',num2str(s),'\G',num2str(g),'\',sss);

fid = fopen(name);




      FRAM =fread(fid,'ubit16');

      FRAM=vec2mat(FRAM,320);


      
          I=imadjust(mat2gray(FRAM));
          
           image_size = [112 112];
  
  I=imresize(I,image_size);
      
      opBaseFileName = sprintf('%s.png', strcat('S',num2str(s),'-G',num2str(g),'-T',sss));  
      opFullFileName = fullfile(data, opBaseFileName);
      imwrite(I,opFullFileName,'png');
      
fclose('all');

end
  

end
end