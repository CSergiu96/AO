function ims(B)
  if(B == 1)
  subplot(222);
  x = imread('AOIRN.png');
  imshow(x,'InitialMagnification',150); 
  else
      if(B == 2)
      subplot(222);
      x = imread('AONRN.png');
      imshow(x,'InitialMagnification',150); 
      else
          if(B == 3)
          subplot(222);
          x = imread('R.png');
          imshow(x,'InitialMagnification',150); 
          else
              if(B == 4)
              subplot(222);
              x = imread('RI.png');
              imshow(x,'InitialMagnification',150); 
              end
          end
      end
  end
end