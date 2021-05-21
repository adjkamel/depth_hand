
function list=run(act,ind,ax0,ax1,ax2)



I=imread(strcat('rgb\',act,'-color.png'));

imshow(I,'Parent', ax0);


I=imread(strcat('depth\',act,'-depth.bin.png'));

imshow(I,'Parent', ax1);

I=imread(strcat('crop\',act,'-depth.bin.png'));

imshow(I,'Parent', ax2);


load('gesture.mat');

list= Matrix1(ind,2:12);


%axes(handles.axes54);

%imshow(yourImage);



end
