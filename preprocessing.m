
s=pwd;

dtrainRaw = dir('trainRaw\*.png');
foldertrain='trainRaw\';


 folderR='train\';


for i = 1:length(dtrainRaw)                                                                                                            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% read depth images in folder

      sss=dtrainRaw(i).name;

      im = imread(strcat(foldertrain,sss));


     im = imcrop(im,[190 90 320 280]);                                                                                                  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   crop  region  with size of [190 90 320 280]

                for ii=1 : size(im,1)                                                                                                   %%%%%%%%%%%%%%%%%%%%%% Loop : delete background pixels based on a threshold (30)
                for jj=1 : size(im,2)
                   if (im(ii,jj)> 30)
                      im(ii,jj)=0;
                   end
                end
                end


      I=mat2gray(im);
      originalMinValue = single(min(min(I)));
      originalMaxValue = single(max(max(I)));
      originalRange = originalMaxValue - originalMinValue;
      desiredMin = 0;
      desiredMax = 1;
      desiredRange = desiredMax - desiredMin;
     I = desiredRange * (single(I) - originalMinValue) /originalRange + desiredMin;                                                 %%%%%%%%%%% depth normalisation (divde the pizxels values on the max to get values between ) and 1)



     BW = im2bw(I, 0.8);                                                                                                            %%%%%%%%%%% convert the image to binarry image


      for ii=1 : size(I,1)
                for jj=1 : size(I,2)
                   if (BW(ii,jj)> 0)
                      I(ii,jj)=0;
                   else
                       I(ii,jj)=I(ii,jj)+0.3;
                   end
                end
                end



   se = strel('disk',3);
 I = imclose(I,se);                                                                                                                 %%%%%%%%%%%%  close regions to coplete hand shape



 for ii=1 : size(im,1)
                for jj=1 : size(im,2)
                   if (I(ii,jj)<= 0.5)                                                                                              %%%%%%%%%%%%%% further delete small regions with threshold < 0.5
                      I(ii,jj)=0;
                   end
                end
 end

                I=imfill(I);                                                                                                        %%%%%%%%%%%%%%% fill holes




 for ii=1 : size(I,1)
                for jj=1 : size(I,2)

                      I(ii,jj)=I(ii,jj)-0.3;

                end
 end

  image_size = [112 112];

  I=imresize(I,image_size);                                                                                                         %%%%%%%%%%%%%%% resize image to 224x224

     sss=sss(1:(length(sss)-4));
      opBaseFileName = sprintf('%s.png', sss);
      opFullFileName = fullfile(folderR, opBaseFileName);
      imwrite(I,opFullFileName,'png');

end
